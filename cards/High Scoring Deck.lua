SMODS.Back({
    key = 'highscoring',
    atlas = 'reffs',
    pos = { x = 1, y = 0 },    
    unlocked = true,
    discovered = true,
    calculate = function(self, back, context)
        
        if context.blind_defeated and G.GAME.blind.boss then
            SMODS.Mods.Roffle.config.highscoring.randomise = true
        end

        -- if G.STATE == G.STATES.NEW_ROUND and G.GAME.round_resets.ante == 1 then
        --     G.GAME.win_ante = 12
        -- end

    end,
    unlock_condition = {type = 'win_deck', deck = 'b_red'}
})
