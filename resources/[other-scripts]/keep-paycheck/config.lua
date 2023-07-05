Config = Config or {}

Config.menu = 'qb-menu' -- keep-menu / qb-menu

Config.intraction = {
     npc = {
          model = 'MP_F_ExecPA_01',
          variant = {
               [2] = {
                    -- hair
                    drawableId = 1,
                    textureId = 0,
               },
               [3] = {
                    -- upper
                    drawableId = 2,
                    textureId = 0,
               },
               [4] = {
                    -- lower
                    drawableId = 2,
                    textureId = 2,
               },
               [6] = {
                    -- feet
                    drawableId = 0,
                    textureId = 0,
               },
               [7] = {
                    -- teef
                    drawableId = 0,
                    textureId = 2,
               },
               [8] = {
                    -- accs
                    drawableId = 2,
                    textureId = 1,
               },
               [11] = {
                    -- jbib
                    drawableId = 1,
                    textureId = 1,
               }
          },
          coords = vector4(269.27, 217.18, 105.28, 65),
          voice = 'A_F_Y_BUSINESS_02_WHITE_FULL_01',
          flag = 1,
          freeze = true,
          invincible = true,
          blockevents = true,
     },
     box = {
          minz_offset = -1,
          maxz_offset = 1.75,
          w = 1.5,
          l = 2.35,
          heading = 160.0
     }
}
