-- Black Shirt ($7 Uncommon)
-- This Joker gains X0.2 Mult if played hand contains Three of a Kind
-- (Currently X1 Mult)

SMODS.Joker{
    key = 'black_shirt',
    atlas = 'roffers',
    rarity = 2,
    cost = 7,
    perishable_compat = false,
    pos = { x = 1, y = 4 },
    config = { extra = { Xmult = 1, Xmult_mod = 0.2 } },
    loc_vars = function(self,info_queue,card)
        return {vars = { card.ability.extra.Xmult_mod, card.ability.extra.Xmult }}
    end,
    calculate = function(self,card,context)
        if context.before and not context.blueprint and next(context.poker_hands['Three of a Kind']) then
            card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
            return {
                message = localize('k_upgrade_ex'),
        colour = G.C.MULT
            }
        elseif context.joker_main then
            return {
                Xmult = card.ability.extra.Xmult
            }
        end
    end,
    set_badges = function (self, card, badges)
        badges[#badges+1] = create_badge(localize('k_roff_credit_l6_art'), ROFF.C.credits.Lucky6, G.C.WHITE, 0.8)
        badges[#badges+1] = create_badge(localize('k_roff_credit_l6_code'), ROFF.C.credits.Lucky6, G.C.WHITE, 0.8)
    end
}
