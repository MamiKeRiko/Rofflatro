return {
    descriptions = {
        Joker = {
            j_roff_typeA = {
                name = 'Type A Joker',
                text = {
                    'Gains {X:mult,C:white}X#1#{} Mult if played',
                    'hand is a {C:attention}#3#{}',
                    '{s:0.8}Hand changes every round ^',
                    'Resets when playing a',
                    '{C:attention}Three of a Kind{} or lesser',
                    '{C:inactive}(Currently {}{X:mult,C:white}X#2#{}{C:inactive} Mult){}',
                    '{s:0.8,C:inactive,E:2}Play the #3#! {}{s:0.8,C:inactive,E:1}STREAMER!!!{}'
                }
            },
            j_roff_jackin_it = {
                name = 'Jackin\' It',
                text = {
                    'This Joker gains {C:mult}+#1#{} Mult',
                    'for every scored {C:attention}Jack{}',
                    '{C:inactive}(Currently {}{C:mult}+#2#{} {C:inactive}Mult){}',
                    '{s:0.8,C:inactive,E:2}On stream? How inappropiate!'
                }
            },
            j_roff_money_shots = {
                name = 'Money Shots',
                text = {
                    "Creates {C:attention}The Hermit{}",
                    "when earning money",
                    "from a {C:attention}Lucky Card{}",
                    "{C:inactive}(Must have room)",
                    "{s:0.8,C:inactive,E:1}Hoooooolyyyyyy..."
                }
            },
            j_roff_benus = {
                name = 'Benus',
                text = {
                    "Earn {C:money}$#1#{} if played hand",
                    "contains {C:attention}Three of a Kind{}",
                    "Lose {C:money}$#2#{} if hand doesn't",
                    "contain {C:attention}Three of a Kind{}",
                    "{C:inactive,s:0.8,E:2}What did he just say?!"
                }
            },
            j_roff_primes = {
                name = 'Thanks For The Primes',
                text = {
                    "This Joker gains {C:chips}+#1#{} Chips",
                    "if hand contains {C:attention}#3#{} or more",
                    "scoring {C:attention}2s{}, {C:attention}3s{}, {C:attention}5s{} and/or {C:attention}7s{}",
                    "{C:inactive}(Currently{} {C:chips}+#2#{} {C:inactive}Chips){}",
                    "{C:inactive,s:0.8,E:2}Shoutouts to {}{C:inactive,s:0.8,E:1}bajabussyblaster!"
                }
            },
            j_roff_4k = {
                name = 'Caught In 4K',
                text = {
                    "{C:chips}+#1#{} Chips for each",
                    "{C:attention}retrigger{} on first",
                    "scored {C:attention}face{} card",
                    "{C:inactive,s:0.8,E:2}Every video is the same."
                }
            },
            j_roff_looksinside = {
                name = 'Looks Inside',
                text = {
                    "After {C:attention}#1#{} rounds {C:inactive}[#2#/#1#]{},",
                    "sell this Joker to create",
                    "{C:attention}Photograph{} and {C:attention}Hanging Chad{}",
                    "{C:inactive}(Must have room)",
                    "{C:inactive,s:0.8,E:2}He can't keep getting away with this!"
                }
            },
            j_roff_wellmet = {
                name = 'Well Met',
                text = {
                    "Cards held in hand",
                    "with {C:attention}Favorite{} sticker",
                    "give {X:mult,C:white}X#1#{} Mult" -- flavor text is done via gui dynatext shenanigans
                }
            },
            j_roff_grossmichael = {
                name = 'Gross Michael',
                text = {
                    "Creates {C:attention}Gros Michel{} at end of shop",
                    "Gains {X:mult,C:white}X#1#{} Mult per {C:attention}Gros Michel{}",
                    "owned at end of round",
                    "{C:attention}Destroyed{} with {C:attention}Gros Michel{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
                    "{C:inactive,s:0.8,E:2}Ew! Why won't you {C:inactive,s:0.8,E:1}DIE?!"
                }
            },
            j_roff_excommunication = {
                name = 'Excommunication',
                text = {
                'Held {C:spectral}Spectrals{} turn {C:dark_edition,E:1}Negative',
                'This Joker gains {X:mult,C:white}X#1#{} Mult',
                'when a {C:spectral}Spectral{} card is {C:attention}used{}',
                'and {X:mult,C:white}X#2#{} Mult if {C:attention}sold{} instead',
                '{C:inactive}(Currently {X:mult,C:white}X#3#{} {C:inactive}Mult)',
                '{C:inactive,s:0.8,E:2}I ain\'t afraid of no... Ghost Deck?',
                '{C:inactive,s:0.6,E:2}that\'s a lie from our vanilla balancer',
            }
         },
            j_roff_dvd = {
                name = 'DVD',
                text = {
                    "Gains {C:chips}+#1#{} Chips when",
                    "any {C:green}probability{} effect",
                    "{C:attention}fails{} to trigger",
                    "{C:inactive}(Currently {C:chips}+#2# {C:inactive}Chips)",
                    "{C:inactive,s:0.8,E:2}It hit the corner! I saw it!"
                }
            },
            j_roff_a7x = {
                name = 'Avenged Sevenfold',
                text = {
                    "This Joker gains {C:mult}+#1#{} Mult",
                    "if played hand contains",
                    "an {C:attention}Ace{} and a {C:attention}7{}",
                    "{C:inactive}(Currently {C:mult}+#2# {C:inactive}Mult)",
                    "{C:inactive,s:0.8,E:2}It's not funny guys."
                }
            },
            j_roff_in_n_out = {
                name = 'In-n-Out',
                text = {
                    "This Joker gains {C:chips}+#1#{} Chips",
                    "when {C:red}no{} {C:attention}rerolls{} are used",
                    "in a {C:attention}shop{}",
                    "{C:inactive}(Currently {C:chips}+#2# {C:inactive}Chips)",
                    "{C:inactive,s:0.8,E:2}So much better than Chick-Fil-A!"
                }
            },
            j_roff_never_punished = {
                name = 'Never Punished',
                text = {
                    "Sell this Joker in a {C:attention}Boss Blind",
                    "to create a {C:attention}Glass face{} card",
                    "and draw to hand",
                    "{C:inactive,s:0.8,E:2}It's called skill."
                }
            },
            j_roff_pivot = {
                name = 'The Pivot',
                text = {
                    'Earn {C:money}$#1#{} at end of round',
                    "after playing a hand that",
                    "isn't your {C:attention}most played",
                    "{C:attention}#2#{} times in a row",
                    "{C:inactive,s:0.8,E:2}Never too late!"
                }
            },
            j_roff_jake = {
                name = 'Jake',
                text = {
                    "This Joker gains {X:mult,C:white}X#2#{} Mult",
                    "for each {C:attention}Diet Cola{}",
                    "sold this run",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)",
                    "{C:inactive,s:0.8,E:2}Always take the Cola. {C:inactive,s:0.8,E:1}ALWAYS."
                }
            },
            j_roff_black_shirt = {
                name = 'Black Shirt',
                text = {
                    "This Joker gains {X:mult,C:white}X#1#{} Mult",
                    "if played hand contains",
                    "{C:attention}Three of a Kind{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
                    "{C:inactive,s:0.8,E:2}Wonder what his wardrobe looks like..."
                }
            },
            j_roff_murphy = {
                name = 'Murphy',
                text = {
                    "Gain {C:money}$#1#{} at end of round",
                    "if deck has no {C:attention}9s",
                    "{C:inactive,s:0.8,E:2}Don't look! {C:inactive,s:0.8,E:1}Don't look!!!"
                }
            },
            j_roff_hearthstone = {
                name = 'Hearthstone?',
                text = {
                    "Scored {C:attention}Wild Cards{} get",
                    "a random {C:attention}Seal",
                    "{C:inactive,s:0.8,E:2}What's that? Never heard of it."
                }
            },
            j_roff_o7 = {
                name = 'o7',
                text = {
                    "If scored chips are at least",
                    "{C:attention}50%{} of required chips,",
                    "prevents {C:attention}death{} and gives {C:money}$#1#{}",
                    "{S:1.1,C:red,E:2}Self destructs{}",
                    "{C:inactive,s:0.8,E:2}False alarm guys!"
                }
            },
            j_roff_sevens = {
                name = "Sevens Suck",
                text = {
                    "Scored {C:attention}7s{} have",
                    "a {C:green}#1# in #2#{} chance to",
                    "give {X:mult,C:white}X#3#{} Mult",
                    "{C:inactive,s:0.8,E:2}ZERO synergies. Horrible.",
                    "{C:inactive,s:0.6,E:2}Wait, have I seen this one before?"
                }
            },
            j_roff_birthday = {
                name = "Happy Birthday!",
                text = {
                    "{C:attention}Booster Packs{} have",
                    "{C:attention}#1#{} more card",
                    "to choose from",
                    "{C:inactive,s:0.8,E:2}Thanks I guess?"
                }
            },
            j_roff_voucherclear = {
                name = "Voucher Clear",
                text = {
                    "{C:attention}Remove{} all {C:attention}Vouchers{}",
                    "in the shop {C:attention}permanently",
                    "at the end of every",
                    "{C:attention}Big Blind{} shop",
                    "{C:inactive,s:0.8,E:2}I hate you, Magic Trick!!!"
                }
            },
            j_roff_thumbnail = {
                name = "The Thumbnail",
                    text = {
                        '{X:mult,C:white}X#1#{} Mult if exactly',
                         '{C:attention}#2#{} Jokers are owned',
                         '{C:inactive}(The Thumbnail included){}',
                         "{C:inactive,s:0.8,E:2}It's always clickbait!{}"
                    }
            },
            j_roff_crashout = {
                name = "Crashout",
                text = {
                    "When blind is selected,",
                    "{C:attention}destroys{} all owned {C:attention}consumables",
                    "This Joker gains {X:mult,C:white}X#2#{} Mult",
                    "per consumable destroyed",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{} {C:inactive}Mult)",
                         "{C:inactive,s:0.8,E:2}Why is streamer mad?{}"
                }
            },
            j_roff_neverskip = {
                name = "Never Skip",
                text = {
                    "When skipping a blind,",
                    "creates an {C:attention}Investment Tag{}",
                    "and a {C:attention}Voucher Tag",
                    "{S:1.1,C:red,E:2}Self destructs{}",
                    "{C:inactive,s:0.8,E:2}I didn't say{} {C:inactive,s:0.8,E:1}never...{}"
                }
            },
            j_roff_spec_oops = {
                name = "Speculative Oops",
                text = {
                    "{C:green}#1# in #2# in #2# in #2# in #2#{} chance",
                    "to earn {C:money}$#3#{} at end of round",
                    "{C:inactive,s:0.8,E:2}Always take the Oops. ALWAYS.",
                    "{C:inactive,s:0.6,E:2}Oh, the 1 in 16 becomes a 1 in 1..."
                }
            },
            j_roff_kali = {
                name = "Kali's Banhammer",
                text = {
                    'Sell this Joker to {C:attention}destroy{}',
                    "all adjacent {C:attention}Jokers{}",
                    'and create a {C:spectral}Spectral{} card',
                    'for each Joker destroyed',
                    '{C:inactive}(Must have room){}',
                    '{C:inactive,s:0.8,E:2}Fastest ban in the west!{}'
                }
            },
            j_roff_Doc = {
                name = 'What Would Doc Do?',
                text = {
                    'Gains {X:mult,C:white}X#1#{} at end of round',
                    'if {C:attention}interest{} is maxed out',
                    'Resets if you are below an',
                    '{C:attention}interest{} threshold',
                    '{C:inactive}(Currently {}{X:mult,C:white}X#2#{}{C:inactive} Mult){}',
                    '{s:0.8,C:inactive,E:2}Money is strength. Stop rerolling.'
                }
            },
            j_roff_Grimbo = {
                name = 'Grimbo',
                text = {
                    "Gain {C:money}+#1#${} per hand played",
                    "Lose {C:money}#1#${} per discard",
                    '{s:0.8,C:inactive,E:2}Slander will NOT be tolerated.'
                }
            },
            j_roff_MainChannel = {
                name = 'Main Channel',
                text = {
                    '{C:green}#1# in #2#{} chance', 
                    'to multiply a value',
                    'in all owned Jokers by {X:mult,C:white}X1.5{}',
                    'at end of round',
                    "{S:1.1,C:red,E:2}Self destructs{} after triggering",
                    '{C:inactive}(Cannot scale Main Channel){}',
                    '{C:inactive,s:0.8,E:2}Wait, he has a main channel?'
                }
            },
            j_roff_getchips = {
                name = 'Just Get Chips',
                text = {
                    'This Joker copies',
                    'all {C:chips}chip{} effects',
                    'of all owned {C:attention}Jokers',
                    "{C:inactive,s:0.8,E:2}We're on Plasma Deck, right?..."
                }
            },
            j_roff_moralsupport = {
                name = 'Buddy',
                text = {
                    '{C:dark_edition}+1{} Joker slot',
                    "{C:inactive,s:0.8,E:2}Just here for the vibes."
                }
            },
            j_roff_catfood = {
                name = 'Cat Food',
                text = {
                    "Retriggers {C:attention}Lucky{} cards",
                    "{C:attention}once{} if both effects",
                    "{C:mult}fail{} to trigger",
                    "{C:inactive,s:0.8,E:2}My cat's starving, please feed it!"
                }
            },
             j_roff_cat_ears = {
                name = 'Cat Ears',
                text = {
                    "This Joker gains {C:chips}+#1#{} Chips if",
                    "played hand contains at least",
                    "{C:attention}2{} unique scoring cards",
                    "{C:inactive}(i.e. different rank or suit){}",
                    "{C:inactive}(Currently {C:chips}+#2#{}{C:inactive} Chips){}",
                    "{C:inactive,s:0.8,E:2}Do it, streamer. Put them on."
                }
            },
            j_roff_free_negatives = {
                name = 'Free Negatives',
                text = {
                    "For the next {C:attention}#1#{} round(s),",
                    "gain a {C:dark_edition}Negative Tag{}",
                    "at end of shop",
                    "{C:inactive,s:0.8,E:2}More Jokers, more score!"
                }
            },
            j_roff_engagement = {
                name = 'Engagement',
                text = {
                    'Creates a {C:spectral}Spectral{} card',
                    'if no {C:chips}hands{}, {C:mult}discards{},',
                    'or {C:attention}consumables{} left',
                    'at end of round',
                    "{C:inactive}(Must have room)",
                    '{C:inactive,s:0.8,E:2}Make sure to like and comment!',
                    '{C:inactive,s:0.6,E:2}(or maybe even be trans   parent)',
                }
            },
            j_roff_faces = {
                name = 'Where Faces?',
                text = {
                    'Discarded {C:attention}face{} cards',
                    'have a {C:green}#1# in #2#{} chance',
                    'to be {C:attention}destroyed{}',
                    'and give {C:money}#3#${}',
                    "{C:inactive,s:0.8,E:2}Who killed my face cards?!"
                }
            },
            j_roff_nice = {
                name = 'Nice',
                text = {
                    'Scoring {C:attention}6s{} give {V:1}#1#{} #3#',
                    'Held in hand {C:attention}9s{} give {V:2}#2#{} #4#',
                    'Switches when hand played',
                    '{C:inactive,s:0.8,E:2}Nice.'
                }
            },
            j_roff_draw_diamonds = {
                name = 'Draw the Diamonds',
                text = {
                    '{C:attention}Scored{} cards with {C:diamonds}Diamond{} suit',
                    'are converted to {C:attention}different{} suits',
                    'Raises the interest cap by {C:money}$#1#',
                    'for every {C:attention}7 {C:diamonds}Diamonds{} scored',
                    '{C:inactive}(Currently +{C:money}$#2#{C:inactive}, #3#/7)',
                    '{C:inactive,s:0.8}It\'s always the Diamonds...{}'
                },
            },
            j_roff_clam = {
                name = 'Always Clam!',
                text = {
                    'Gains {C:chips}+#1#{} Chips if hand',
                    'scores less than {C:attention}25% of',
                    'score requirement, resets',
                    'when {C:attention}Boss Blind{} is defeated',
                    '{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)',
                    '{C:inactive,s:0.8,E:2}Never been mad in my life!'
                }
            },
            j_roff_vod_watchers = {
                name = 'VOD Watchers',
                text = {
                    'Gains {X:mult,C:white}X#1#{} Mult',
                    'per {C:attention}hand played',
                    'Resets when beating',
                    'a Blind in {C:attention}one hand',
                    '{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Chips)',
                    '{C:inactive,s:0.8,E:2}Don\'t wake them up!'
                }
            },
            j_roff_magic8 = {
                name = 'Magic 8 Ball',
                text = {
                    'Scored {C:attention}Favorite 8s{} have a',
                    '{C:green}#1# in #2#{} chance to be',
                    '{C:attention}copied{} and drawn to hand',
                    '{C:inactive,s:0.8,E:2}DNA, but... really bad.',
                    '{C:inactive,s:0.6,E:2}How did we even get here?'
                }
            },
            j_roff_whydontyou = {
                name = 'Why Don\'t You Play Them?',
                text = {
                    'Scoring {C:attention}non-Favorite{} cards',
                    'permanently gain {C:mult}+#1#{} Mult',
                    '{C:inactive,s:0.8,E:2}It\'s not Plantain, Neato, or Paperback...',
                }
            },
            j_roff_watergun = {
                name = "Water Gun",
                text = {
                    "Retriggers the next",
                    "{C:attention}#1#{} scored card(s)",
                    "with {C:attention}Favorite{} sticker",
                    '{C:inactive,s:0.8,E:2}Watch out, they\'re coming!',
                }
            },
            j_roff_infocard = {
                name = "Info Card",
                text = {
                    "{C:chips}+#2#{} chips for every",
                    "{C:attention}Joker{} added to deck",
                    "{C:inactive}(Currently {C:chips}+#1# {C:inactive}chips)",
                    '{C:inactive,s:0.8,E:2}Everybody say "Thank you, Edalo"!',
                }
            },
        },
        Voucher = {
            v_roff_coupon = {
                name = "Coupon Bonding",
                text = {
                    '{C:mult}+#1#{} Mult for each redeemed Voucher',
                    '{C:inactive,s:0.8,E:2}Works with Blanks when you run out!',
                    '{C:inactive,s:0.6,E:2}(wink, wink, second tier?)',
                },
            },
            v_roff_blanket = {
                name = "Blanket Statement",
                text = {
                    '{X:mult,C:white}X#1#{} XMult for each redeemed Blank',
                    '{C:inactive,s:0.8,E:2}Hey, is this meant to say "X#1# Mult"?',
                    '{C:inactive,s:0.6,E:2}Wait, what do you mean by "intended"!?',
                },
            },
            v_roff_deckfixer = {
                name = "Deck Fixer",
                text = {
                    '{C:attention}Standard Packs{} always have',
                    'one copy of a {C:attention}Favorite{}',
                    'playing card in your deck',
                    '{C:inactive,s:0.8,E:2}Court-mandated Favorite sticker buff!',
                },
            },
            v_roff_deckstuffer = {
                name = "Deck Stuffer",
                text = {
                    'Copies of {C:attention}Favorite{}',
                    'cards may appear in shop',
                    '{C:inactive,s:0.8,E:2}Court-mandated Favorite sticker buff!',
            },
        },
    },
    Back =
    {
        b_roff_streamerluck = {
            name = "Streamer Deck",
            text = {
                "{C:attention}Non-common{} Jokers appear",
                "{C:attention}4x{} more often",
                "{E:1,C:inactive,s:0.8}(Is this run seeded?)",
            },
        },
        b_roff_highscoring = {
            name = "High Scoring Deck",
            text = {
                "Start with a {C:common}Common{},",
                "{C:uncommon}Uncommon{}, and {C:rare}Rare{} Joker",
                "{C:red}Winning ante is Ante 12",
                "{E:1,C:inactive,s:0.8}Welcome back to another high-scoring run...",
                "{C:inactive,s:0.7}By the way, win Ante 1 to reset the jokers.",
                "{C:inactive,s:0.6}Some of you can't have fun..."
            },
        },
    },
    Mod = 
    {
        Roffle = {
            name = "Rofflatro",
            text = {
                "A vanilla-friendly mod made for {C:chips,E:1}Roffle!{}",
                " ",
                "{s:1.5,C:attention,E:2}Credits:",
                "{C:dark_edition,E:2}Lucky6(AlrexX){} - Lead, Art, Code",
                "{C:dark_edition,E:2}Maxx{} - Design, Art, Code",
                "{C:dark_edition,E:2}canicao{} - Design, Art, Code",
                "{C:dark_edition,E:2}garb{} - Code (Streamer Deck)",
                "{C:dark_edition,E:2}UHadMeAtFood{} - Art, Code",
                " ",
                "{s:1.5,C:attention,E:2}Also Try:",
                "{C:dark_edition,E:1}GARBSHIT{}, {C:dark_edition,E:1}Lucky Jimbos/Legends{}, {C:dark_edition,E:1}Bountiful Update{}",
                " ",
                "{s:0.9}Special thanks to the {C:attention,s:0.9}Balatro Discord!{}"
            }
        }
    }
},
    misc = {
        challenge_names = {
            c_roff_thumbnail = 'Three Card Monte',
            c_roff_kali = 'Trigger Happy',
            c_roff_a7x = 'Where Are My Sevens?',
            c_roff_nofaves = 'No Favorites',
            c_roff_fashion = 'Fashion Disaster',
        },
        v_text = {
            ch_c_kali_spawn = {"Creates a Perishable {C:attention}Kali's Banhammer{} when boss blind selected"},
            ch_c_whitelist_hand = {"Must play {C:attention}#1#{}"},
        },
        dictionary = {
            k_roff_wellmet_flavor = 'Well Met! Well Met! Well Met! ',
            k_roff_gross_dead = 'Good Riddance!',
            k_roff_gross_add_banana = 'Gross!',
            k_roff_pivot_active = 'Pivot!',
            k_roff_inout_fail = 'Bad taste!',
            k_roff_o7_saved = 'Close one chat!',
            k_roff_crashout_upgrade = 'Crashout!',
            k_roff_typea_update = "Streamer!",
            k_roff_doc_upgrade = "Muhhhhnee!",
            k_roff_doc_reset = "Bummer...",
            k_roff_mainchannel_upgrade = "What?!",
            k_roff_negatives_trigger = "Yippee!",

            k_roff_magic8_1 = "Certain",
            k_roff_magic8_2 = "Yup",
            k_roff_magic8_3 = "Decidedly",
            k_roff_magic8_4 = "Perchance",
            k_roff_magic8_5 = "Likely",
            k_roff_magic8_fail_1 = "Nope",
            k_roff_magic8_fail_2 = "Doubtful",
            k_roff_magic8_fail_3 = "Unknown",
            k_roff_magic8_fail_4 = "Not Now",
            k_roff_magic8_fail_5 = "Try Again",

            k_roff_buddy_msg1 = "You got this!",
            k_roff_buddy_msg2 = "I believe!",
            k_roff_buddy_msg3 = "Go gettem!",
            k_roff_buddy_msg4 = "To the moon!",
            k_roff_buddy_msg5 = "You're the best!",

            k_roff_credit_l6_art = 'Art: Lucky6/AlrexX',
            k_roff_credit_l6_code = 'Code: Lucky6/AlrexX',
            k_roff_credit_maxx_art = 'Art: Maxx',
            k_roff_credit_maxx_code = 'Code: Maxx',
            k_roff_credit_canicao_art = 'Art: canicao',
            k_roff_credit_canicao_code = 'Code: canicao',
            k_roff_credit_garb_code = 'Code: garb',
            k_roff_credit_uhadme_art = 'Art: UHadMeAtFood',
            k_roff_credit_uhadme_code = 'Code: UHadMeAtFood',
            k_roff_credit_splatter_art = 'Art: splatter'
        }
    }
}
