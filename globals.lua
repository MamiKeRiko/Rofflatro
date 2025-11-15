-- set custom globals
ROFF = {
    C = {
        main =  HEX('6E3AA6'),
        secondary = HEX('a36be8'),
        credits = {
            Lucky6 = HEX('fa5eff'),
            canicao = HEX('4b4687'),
            canicao_text = HEX('b9af87'),
            uhadme = HEX('56a786')
        }
    },

    funcs = {
        
        --- Given an `amount` of cards, an index `i` of the current card's position 
        --- in this group of cards, and a delay `t` between each card being flipped,
        --- flips `card`, performs `function` while `card` is flipped, and un-flips `card`.
        --- @param card table
        --- @param i number
        --- @param amount number
        --- @param t number
        --- @param func function
        flip_unflip = function (card, i, amount, t, func)
            G.E_MANAGER:add_event(Event({ -- first flip
                trigger = "after",
                delay = (i - 1) * t, -- this is meant to be a delay for when you flip/unflip a whole hand for instance, so each flipped card does it sequentially. t is the delay between card flips
                blockable = false,
                func = function() 
                    card:flip()
                    play_sound('card1')
                    card:juice_up(0.3, 0.3)
                    return true
                end 
            }))
    
            G.E_MANAGER:add_event(Event({ -- perform func passed by the call
                func = function()
                    func()
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({ -- second flip
                trigger = "after",
                delay = ((i - 1) * t) + (amount * t), -- after all the cards are done flipping, start flipping again from the start
                blockable = false,
                func = function()
                    G.E_MANAGER:add_event(Event({
                        blockable = false,
                        trigger = 'after',
                        delay = 0.35,
                        func = function() 
                            card:flip()
                            play_sound('tarot2')
                            card:juice_up(0.3, 0.3)
                            return true 
                        end 
                    }))
                    return true
                end
            }))
        end,
    
        --- Given a card's `id`, return its corresponding character. (2-9, T, J, Q, K, A)
        --- @param id number
        --- @return string|number|nil
        parse_id_to_rank = function (id)
             -- imagine if lua had switch statements wouldn't that be crazy useful haha
            if id < 10 then return id
            elseif id == 10 then return 'T'
            elseif id == 11 then return 'J'
            elseif id == 12 then return 'Q'
            elseif id == 13 then return 'K'
            elseif id == 14 then return 'A'
            else return nil
            end
        end,

        --- Given a card's `suit` name, return its initial. (H, S, C, D)
        ---@param suit string
        ---@return string
        parse_suit = function (suit)
            return suit:sub(1,1)
        end,

        --- Given a `hand_name`, return the key for its corresponding planet card.
        ---@param hand_name string
        ---@return string
        get_planet_from_hand = function (hand_name)
            for _, v in pairs(G.P_CENTER_POOLS.Planet) do
                if v.config.hand_type == hand_name then
                    return v.key
                end
            end
        end,

        --- Returns the name of the current most played hand.
        --- @return string
        get_most_played_hand = function ()
            local hand, played, order = 'High Card', -1, 100
            for k, v in pairs(G.GAME.hands) do
                if v.played > played or (v.played == played and order > v.order) then
                    played = v.played
                    hand = k
                end
            end
            return hand
        end,

        --- Credit to Aikoyori for this function, and RenSnek for expanding it. Given a `table_in` (value table or card object) and a config table, modifies the values in `table_in` depending 
        --- on the `config` provided. `config` accepts these values:
        --- * `add`
        --- * `multiply`
        --- * `keywords`: list of specific values to change in `table_in`. If nil, change every value in `table_in`.
        --- * `unkeywords`: list of specific values to *not* change in `table_in`.
        --- * `x_protect`: if true (or not set), any X effects (Xmult, Xchips, etc.) whose value is currently 1 are not modified. If false, this check is bypassed - which may result in some unlisted values being 
        --- modified.
        --- * `reference`: initial values for the provided table. If nil, defaults to `table_in`.
        --- 
        --- This function scans all sub-tables for numeric values, so it's recommended to pass the card's ability table rather than the entire card object.
        ---@param table_in table|Card
        ---@param config table
        mod_card_values = function (table_in, config)
            if not config then config = {} end
            local add = config.add or 0
            local multiply = config.multiply or 1
            local keywords = config.keywords or {}
            local unkeyword = config.unkeywords or {}
            local x_protect = config.x_protect or true -- If true and a key starts with x_ and the value is 1, it won't multiply
            local reference = config.reference or table_in
            local function modify_values(table_in, ref)
                for k,v in pairs(table_in) do -- For key, value in the table
                    if type(v) == "number" then -- If it's a number
                        if (keywords[k] or (ROFF.REND.table_true_size(keywords) < 1)) and not unkeyword[k] then -- If it's in the keywords, OR there's no keywords and it isn't in the unkeywords
                            if ref and ref[k] then -- If it exists in the reference
                                if not (x_protect and (ROFF.REND.starts_with(k,"x_") or ROFF.REND.starts_with(k,"h_x_")) and ref[k] == 1) then
                                    table_in[k] = (ref[k] + add) * multiply -- Set it to (reference's value + add) * multiply
                                end
                            end
                        end
                    elseif type(v) == "table" then -- If it's a table
                        modify_values(v, ref[k]) -- Recurse for values in the table
                    end
                end
            end
            if table_in == nil then
                return
            end
            modify_values(table_in, reference)
        end,

        --- Calls `mod_card_values` to multiply `card`'s values by `mult`, making sure to also modify the nominal value.
        ---@param card table|Card
        ---@param mult number
        xmult_playing_card = function(card, mult)
            local tablein = {
                nominal = card.base.nominal,
                ability = card.ability
            }

            ROFF.funcs.mod_card_values(tablein, {multiply = mult})

            card.base.nominal = tablein.nominal
            card.ability = tablein.ability
        end,

        --- Handles end of round logic for wish cards, increasing the round value and applying effects and 
        --- ui messages where appropiate.
        ---@param card table|Card
        ---@return table
        increase_round_counter = function (card)
            card.ability.extra.rounds_current = card.ability.extra.rounds_current + 1
            if card.ability.extra.rounds_current < card.ability.extra.rounds_min then
                return {
                    message = card.ability.extra.rounds_current .. '/' .. card.ability.extra.rounds_min
                }
            elseif card.ability.extra.rounds_current < card.ability.extra.rounds_min + 2 then
                local eval = function(card) return not card.REMOVED end
                juice_card_until(card, eval, true)
                return {
                    message = localize('k_active_ex')
                }
            else
                card:start_dissolve()
                return {
                    message = localize('k_l6_wither')
                }
            end
        end,

        --- Given the `key` of an enhancement, get its localized name and corresponding UI color.
        ---@param key string
        ---@return string, table
        get_enhancement_name_and_color = function (key)

            local locName = localize({type = 'name_text', set = 'Enhanced', key = key, nodes = {}})
            
            if key == 'm_gold' or key == 'm_lucky' then
                return locName, G.C.GOLD
            elseif key == 'm_steel' or key == 'm_glass' or key == 'm_stone' then
                return locName, G.C.GREY
            elseif key == 'm_mult' then
                return locName, G.C.MULT
            elseif key == 'm_bonus' then
                return locName, G.C.BONUS
            else
                return locName, G.C.SECONDARY_SET['Enhanced']
            end
        end,

        --- Given a voucher's `key`, creates and redeems the voucher instantly.
        ---@param key string
        redeem_voucher = function (key)
            -- copied from cryptid which copied from betmma :V
            local area
            if G.STATE == G.STATES.HAND_PLAYED then
                if not G.redeemed_vouchers_during_hand then
                    G.redeemed_vouchers_during_hand = CardArea(
                        G.play.T.x,
                        G.play.T.y,
                        G.play.T.w,
                        G.play.T.h,
                        { type = "play", card_limit = 5 }
                    )
                end
                area = G.redeemed_vouchers_during_hand
            else
                area = G.play
            end

            local card = SMODS.add_card({set = 'Voucher', area = area, key = key})
            card.cost = 0
            card.shop_voucher = false

            local current_round_voucher = G.GAME.current_round.voucher
            card:redeem()
            table.insert(G.GAME.used_vouchers, key)
            G.GAME.current_round.voucher = current_round_voucher

            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0,
                func = function()
                    card:start_dissolve()
                    return true
                end,
            }))
        end,

        roff_debug = function (key)
            attention_text({
                text = key,
                scale = 1.3, 
                hold = 1.4,
                major = aura_card,
                backdrop_colour = G.C.RARITY[4],
                align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and 'tm' or 'cm',
                offset = {x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and -0.2 or 0},
                silent = true
            })
        end,

        ---Shifts all characters in `text` to the left once, the first character becoming the last.
        ---@param text string
        marquee = function (text)
            local marqueedtext = text:sub(2, #text)..text:sub(1,1)
            return marqueedtext
        end,

        
        ---Copies the context of the table `t` non-recursively into a new table.
        ---@param t table
        ---@return table
        table_shallow_copy = function (t)
            local t2 = {}
            for k,v in pairs(t) do
                t2[k] = v
            end
            return t2
        end
    },
}

-- couple util funcs nabbed from https://github.com/RenSnek/Balatro-Rendoms :33 (nested into ROFF to avoid compatibility issues)
ROFF.REND = {}

--- Credit to RenSnek. Given a string `str` and a shorter string `start`, checks if the string's first `#start` characters are the same as `start`.
---@param str string
---@param start string
---@return boolean
ROFF.REND.starts_with = function(str,start)
    return str:sub(1, #start) == start
end

--- Credit to RenSnek. Given a `table` and a `value`, returns true if `value` is found in `table`.
---@param table table
---@param value any
---@return boolean
ROFF.REND.table_contains = function(table,value)
    for i = 1,#table do
        if (table[i] == value) then
            return true
        end
    end
    return false
end

--- Credit to RenSnek. Given a table, returns a more accurate estimate of its size than the `#` operator.
---@param table table
---@return number
ROFF.REND.table_true_size = function(table)
    local n = 0
    for k,v in pairs(table) do
        n = n+1
    end
    return n
end
