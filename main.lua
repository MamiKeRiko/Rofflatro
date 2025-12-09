-- atlas definitions
SMODS.Atlas {
    key = "roffers",
    path = "Jokers.png",
    px = 71,
    py = 95,
}

SMODS.Atlas {
    key = "rickers",
    path = "Stickers.png",
    px = 71,
    py = 95,
}

SMODS.Atlas {
    key = "reffs",
    path = "Decks.png",
    px = 71,
    py = 95,
}

SMODS.Atlas {
    key = "rauchers",
    path = "Vouchers.png",
    px = 71,
    py = 95,
}

--talisman compat dummy func
to_big = to_big or function (value)
    return value
end

-- load common util funcs
assert(SMODS.load_file("globals.lua"))()
--assert(SMODS.load_file("No Favorites.lua"))()

-- load all individual cards
local subdir = "cards"
local cards = NFS.getDirectoryItems(SMODS.current_mod.path .. subdir)
for _, filename in pairs(cards) do
    if string.sub(filename, string.len(filename) - 3) == '.lua' then
        assert(SMODS.load_file(subdir .. "/" .. filename))()
    end
end

local challenges = NFS.getDirectoryItems(SMODS.current_mod.path .. "challenges")
for _, chal in pairs(challenges) do
    if string.sub(chal, string.len(chal) - 3) == '.lua' then
        assert(SMODS.load_file("challenges/" .. chal))()
    end
end

--favorite card calc
local igo = Game.init_game_object
function Game:init_game_object()
    local ret = igo(self)
    ret.current_round.most_played_card_amount = 0
    return ret
end

-- DVD calc
local prp = SMODS.pseudorandom_probability
function SMODS.pseudorandom_probability(trigger_obj, seed, base_numerator, base_denominator)
    local ret = prp(trigger_obj, seed, base_numerator, base_denominator)
    if not ret then
        SMODS.calculate_context({roff_probability_missed = true}, effects)
    end
    return ret
end

local update_ref = Game.update
function Game:update(dt)
    update_ref(self, dt)
    if G.GAME.modifiers.kali_spawn then
        if G.STATE == G.STATES.BLIND_SELECT and G.GAME.blind.boss and G.GAME.modifiers.kali_spawn_hold == true then 
            SMODS.add_card({key = 'j_roff_kali', stickers = { 'perishable' }})
            G.GAME.modifiers.kali_spawn_hold = false
        end
        if G.STATE == G.STATES.HAND_PLAYED and G.GAME.modifiers.kali_spawn_hold == false then
            G.GAME.modifiers.kali_spawn_hold = true
        end
    end
end

local debuff_hand_ref = Blind.debuff_hand
function Blind:debuff_hand(cards, hand, handname, check)
    local result = debuff_hand_ref(self, cards, hand, handname, check)
    local whitelist = true
    if G.GAME.modifiers.whitelist_hand and #G.GAME.modifiers.whitelist_hand > 0 then
        for _, v in ipairs(G.GAME.modifiers.whitelist_hand) do
            if handname == v then
                whitelist = false
            end
        end
        return whitelist
    end
    return result
end

local debuff_text_ref = Blind.get_loc_debuff_text
function Blind:get_loc_debuff_text()
        if G.GAME.modifiers.whitelist_hand and #G.GAME.modifiers.whitelist_hand > 0 then
            return ('Must play '..G.GAME.modifiers.whitelist_hand[1])
        end
    result = debuff_text_ref(self)
    return result
end

local start_run_ref = Game.start_run
function Game:start_run(args)
    local begin = start_run_ref(self, args)
    if not saveTable then
        if args.challenge then
            local _ch = args.challenge
            G.GAME.challenge_index = args.challenge
            if _ch.rules then
                local whitelistedHands = {}
                if _ch.rules.custom then
                    for k, v in ipairs(_ch.rules.custom) do
                        if v.id == 'kali_spawn' then
                            G.GAME.modifiers.kali_spawn = true
                            G.GAME.modifiers.kali_spawn_hold = true
                        end
                        if v.id == 'whitelist_hand' then --hand is not allowed
                        whitelistedHands = whitelistedHands or {}
                        whitelistedHands[#whitelistedHands+1] = v.hand
                        end
                    end
                end
                G.GAME.modifiers.whitelist_hand = whitelistedHands
            end
        end
    end
    return begin
end

function SMODS.current_mod.reset_game_globals(run_start)
    if not run_start and G.playing_cards then
        G.GAME.current_round.most_played_card_amount = 0
        for _, c in pairs(G.playing_cards) do
            if c.base.times_played > G.GAME.current_round.most_played_card_amount then
                G.GAME.current_round.most_played_card_amount = c.base.times_played
            end
        end
        if G.GAME.current_round.most_played_card_amount > 0 then
            for _, c in pairs(G.playing_cards) do
                if c.base.times_played == G.GAME.current_round.most_played_card_amount then
                    c:add_sticker('roff_favorite', true)
                elseif c.ability.roff_favorite then
                    c.ability.roff_favorite = false
                end
            end
        end
    end
    if run_start then
        G.GAME.ROFF_seance_used = false
        G.GAME.ROFF_blanks_obtained = 0
        G.GAME.ROFF_vouchers_sliced_list = {}

        if G.GAME.selected_back and G.GAME.selected_back.effect.center.key == "b_roff_highscoring" then
            G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.win_ante = 12
                        return true
                    end
                }))
        end
        
        if G.GAME.selected_back and G.GAME.selected_back.effect.center.key == "b_roff_highscoring" and SMODS.Mods.Roffle.config.highscoring.randomise then
            G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.add_card({
                        set = 'Joker',
                        rarity = 'Common',
                        key_append = 'roff_highscoring'
                    }) 
                    SMODS.add_card({
                        set = 'Joker',
                        rarity = 'Uncommon',
                        key_append = 'roff_highscoring'
                    }) 
                    SMODS.add_card({
                        set = 'Joker',
                        rarity = 'Rare',
                        key_append = 'roff_highscoring'
                    })
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.Mods.Roffle.config.highscoring.jokers = {}
                    for i=1, #G.jokers.cards do
                        table.insert(SMODS.Mods.Roffle.config.highscoring.jokers, G.jokers.cards[i].config.center.key)
                    end
                    return true
                end
            }))
            G.GAME.win_ante = 12
            SMODS.Mods.Roffle.config.highscoring.randomise = false
        elseif G.GAME.selected_back and G.GAME.selected_back.effect.center.key == "b_roff_highscoring" then
            for jkey = 1, #SMODS.Mods.Roffle.config.highscoring.jokers do
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.add_card {
                            key = SMODS.Mods.Roffle.config.highscoring.jokers[jkey],
                            key_append = 'roff_highscoring'
                        }
                        return true
                    end
                }))
            end
        end
    end
end

SMODS.current_mod.description_loc_vars = function()
    return { background_colour = G.C.CLEAR, text_colour = G.C.WHITE, scale = 1.2 }
end
