local boxCounts = {
    _strategy = 'RANDOM',
    2, 2, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 7, 8,
}

Config.MISSION_POST_OP = {}

Config.MISSION_POST_OP.Blip = {
    Position = vector3(-424.18, -2786.25, 5.0),
    Scale = 0.6,
    Sprite = 501,
    Colour = 5
}

Config.MISSION_POST_OP.VehicleSpawns = {
    vector4(-433.05, -2782.82, 6.0, 43.0),
    vector4(-445.87, -2790.08, 6.0, 41.0),
    vector4(-450.82, -2794.21, 6.0, 49.0),
    vector4(-416.97, -2783.12, 6.0, 3.0),
}

Config.MISSION_POST_OP.LocationCount = 10

-- @TODO: Target -> $75 per 10 minutes driving
Config.MISSION_POST_OP.RewardPerUnit = 1.0

Config.MISSION_POST_OP.Cooldown = 600
Config.MISSION_POST_OP.Repetitions = 1
Config.MISSION_POST_OP.DeliveryVehicleModel = `boxville4`

Config.MISSION_POST_OP.VehicleReturn = vector3(-433.05, -2782.82, 5.0)

Config.MISSION_POST_OP.Labels = {
    ['MISSION_NAME'] = 'PostOP Delivery',
    ['POST_OP_RETURN'] = 'PostOP',
    ['ENTER_VEHICLE'] = 'Enter ~y~delivery vehicle~s~',
    ['PARK_NEAR'] = {
        'Park near the ~y~delivery box~s~ and unload packages.',
    },
    ['PUT_PACKAGE_IN_BOX'] = {
        'Take packages from the ~y~back of the vehicle~s~',
        'Then put them into the ~y~PostOP box~s~',
    },
    ['PACKAGES_REMAINING'] = '%s packages remaining',
    ['BLIP_POSTOP_BOX'] = 'PostOP Box',
    ['DELIVER_HELP_TEXT'] = '~INPUT_PICKUP~ Deliver',
    ['MISSION_SUCCESS'] = 'The parcels were successfuly distributed.',
    ['RETURN_CAR_MESSAGE'] = {
        'Return the ~y~vehicle~s~ to ~y~PostOP warehouse~s~.',
    },
    ['DRIVE_TO_ANOTHER_BOX'] = {
        'Drive to another ~y~PostOP Box~s~'
    },
    ['COOLDOWN_MESSAGE'] = 'There are no deliveries available right now.',
}

Config.MISSION_POST_OP.BOXES = {
    -- {
    --     _id = GetUniqueId('POSTOP'),
    --     pos = vector3(-101.3913269043, -53.92211151123, 55.365650177002),
    --     rot = vector3(-0.0, -0.0, -18.0),
    --     parkPos =vector3(-103.04, -58.57, 55.36),
    --     deliverPos = vector3(-101.700340271, -54.873168945313, 56.365650177002),
    --     boxCount = boxCounts,
    -- },
    -- {
    --     _id = GetUniqueId('POSTOP'),
    --     pos = vector3(-156.849609375, -34.996757507324, 52.197296142578),
    --     rot = vector3(-0.0, -0.0, -16.999998092651),
    --     parkPos = vector3(-160.76, -38.49, 52.03),
    --     deliverPos = vector3(-157.14198303223, -35.953063964844, 53.197296142578),
    --     boxCount = boxCounts,
    -- },

    -- {
    --     _id = GetUniqueId('POSTOP'),
    --     pos = vector3(-25.030794143677, -93.038238525391, 56.254371643066),
    --     rot = vector3(0.0, -0.0, -109.99999237061),
    --     parkPos = vector3(-29.809139251709, -91.321968078613, 56.254241943359),
    --     deliverPos = vector3(-25.970487594604, -92.696220397949, 57.254371643066),
    --     boxCount = boxCounts,
    -- },

    -- {
    --     _id = GetUniqueId('POSTOP'),
    --     pos = vector3(-68.464881896973, -176.17227172852, 50.943321228027),
    --     rot = vector3(7.654230594635, 0.29265600442886, -20.01957321167),
    --     parkPos = vector3(-70.368560791016, -179.98231506348, 49.920310974121),
    --     deliverPos = vector3(-68.804176330566, -177.10346984863, 51.810127258301),
    --     boxCount = boxCounts,
    -- },
    -- {
    --     _id = GetUniqueId('POSTOP'),
    --     pos = vector3(-294.86441040039, -96.411293029785, 46.053073883057),
    --     rot = vector3(-0.0, -0.0, -18.999998092651),
    --     parkPos = vector3(-285.69564819336, -101.15378570557, 45.722362518311),
    --     deliverPos = vector3(-295.18997192383, -97.356811523438, 47.053073883057),
    --     boxCount = boxCounts,
    -- },







    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(78.396224975586, -1447.1076660156, 28.311683654785),
        rot = vector3(0.0, -0.0, 139.99998474121),
        parkPos = vector3(78.100082397461, -1442.4112548828, 28.311656951904),
        deliverPos = vector3(79.039009094238, -1446.3416748047, 29.311683654785),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(149.46479797363, -1324.6429443359, 28.232585906982),
        rot = vector3(-0.0, -0.0, -35.000003814697),
        parkPos = vector3(151.04750061035, -1329.0593261719, 28.214460372925),
        deliverPos = vector3(148.89122009277, -1325.4620361328, 29.232585906982),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(137.21492004395, -853.71197509766, 29.82152557373),
        rot = vector3(0.0, 0.0, 69.999992370605),
        parkPos = vector3(140.88128662109, -850.79010009766, 29.832279205322),
        deliverPos = vector3(138.15461730957, -854.05401611328, 30.82152557373),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-364.14157104492, -882.84094238281, 30.217700958252),
        rot = vector3(0.0, -0.0, 90.0),
        parkPos = vector3(-361.05267333984, -889.40850830078, 30.074779510498),
        deliverPos = vector3(-363.14157104492, -882.84094238281, 31.217700958252),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-322.95761108398, -713.00610351563, 31.855743408203),
        rot = vector3(0.0, -0.0, 158.99998474121),
        parkPos = vector3(-318.48446655273, -709.26959228516, 31.916395187378),
        deliverPos = vector3(-322.59924316406, -712.07250976563, 32.855743408203),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-201.96873474121, -586.50567626953, 33.511379241943),
        rot = vector3(0.0, -0.0, -109.99999237061),
        parkPos = vector3(-207.93190002441, -584.99603271484, 33.485782623291),
        deliverPos = vector3(-202.90843200684, -586.16363525391, 34.511379241943),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-28.823698043823, -998.08197021484, 28.227983474731),
        rot = vector3(0.0, -0.0, -109.99999237061),
        parkPos = vector3(-30.942003250122, -992.89880371094, 28.254270553589),
        deliverPos = vector3(-29.763391494751, -997.73992919922, 29.227983474731),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(185.78833007813, -1101.6820068359, 28.287469863892),
        rot = vector3(0.0, -0.0, 90.000007629395),
        parkPos = vector3(192.01667785645, -1101.7514648438, 28.294046401978),
        deliverPos = vector3(186.78833007813, -1101.6820068359, 29.287469863892),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(386.19793701172, -908.55334472656, 28.449029922485),
        rot = vector3(0.0, -0.0, 179.99998474121),
        parkPos = vector3(381.79479980469, -906.80908203125, 28.431924819946),
        deliverPos = vector3(386.19793701172, -907.55334472656, 29.449029922485),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(367.55004882813, -753.49371337891, 28.272718429565),
        rot = vector3(0.0, 0.0, 69.999992370605),
        parkPos = vector3(371.58459472656, -750.45697021484, 28.276084899902),
        deliverPos = vector3(368.48974609375, -753.83575439453, 29.272718429565),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(307.32641601563, -704.31811523438, 28.31205368042),
        rot = vector3(0.0, -0.0, 159.99998474121),
        parkPos = vector3(313.12677001953, -703.54150390625, 28.31951713562),
        deliverPos = vector3(307.66842651367, -703.37841796875, 29.31205368042),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(113.47060394287, -332.35784912109, 44.477851867676),
        rot = vector3(0.0, -0.0, 161.0),
        parkPos = vector3(111.8355178833, -327.20755004883, 44.564010620117),
        deliverPos = vector3(113.7961730957, -331.41232299805, 45.477851867676),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-66.103675842285, 9.5321054458618, 70.937690734863),
        rot = vector3(-0.0, -0.0, -21.999996185303),
        parkPos = vector3(-61.548206329346, 6.7914447784424, 70.752578735352),
        deliverPos = vector3(-66.47827911377, 8.6049213409424, 71.937690734863),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-309.44647216797, -55.648090362549, 47.481639862061),
        rot = vector3(0.0, -0.0, 158.99998474121),
        parkPos = vector3(-311.9889831543, -51.245628356934, 47.470336914063),
        deliverPos = vector3(-309.08810424805, -54.714508056641, 48.481639862061),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-634.61584472656, -93.492393493652, 37.074420928955),
        rot = vector3(-0.0, -0.0, -5.9999990463257),
        parkPos = vector3(-638.86193847656, -98.269989013672, 37.048606872559),
        deliverPos = vector3(-634.72039794922, -94.486915588379, 38.074420928955),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-652.546875, -396.06121826172, 33.766693115234),
        rot = vector3(0.0, 0.0, 88.000022888184),
        parkPos = vector3(-651.19183349609, -390.54345703125, 33.770053863525),
        deliverPos = vector3(-651.54748535156, -396.09613037109, 34.766693115234),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-715.91955566406, -873.97576904297, 22.42760848999),
        rot = vector3(0.0, -0.0, 90.000007629395),
        parkPos = vector3(-712.40570068359, -880.08734130859, 22.591773986816),
        deliverPos = vector3(-714.91955566406, -873.97576904297, 23.42760848999),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-1276.1256103516, -1026.4688720703, 8.0883922576904),
        rot = vector3(0.0, -0.0, 105.99999237061),
        parkPos = vector3(-1274.3449707031, -1020.557800293, 8.2161083221436),
        deliverPos = vector3(-1275.1643066406, -1026.1932373047, 9.0883922576904),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-1079.9052734375, -1233.8228759766, 4.0522155761719),
        rot = vector3(0.0, 0.0, 30.0),
        parkPos = vector3(-1076.1484375, -1237.7819824219, 4.1776866912842),
        deliverPos = vector3(-1079.4052734375, -1234.6888427734, 5.0522155761719),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-847.84234619141, -1119.4921875, 6.0610938072205),
        rot = vector3(0.0, -0.0, 120.0),
        parkPos = vector3(-843.40319824219, -1121.9964599609, 6.060950756073),
        deliverPos = vector3(-846.97631835938, -1118.9921875, 7.0610938072205),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-608.65887451172, -1014.0990600586, 20.785655975342),
        rot = vector3(0.0, -0.0, 179.99998474121),
        parkPos = vector3(-608.3349609375, -1008.1268310547, 20.784969329834),
        deliverPos = vector3(-608.65887451172, -1013.0990600586, 21.785655975342),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(272.80087280273, 196.23616027832, 103.71578979492),
        rot = vector3(-0.0, -0.0, -19.999996185303),
        parkPos = vector3(266.5126953125, 195.0207824707, 103.81174468994),
        deliverPos = vector3(272.45886230469, 195.2964630127, 104.71578979492),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-101.68894195557, 41.427913665771, 70.52693939209),
        rot = vector3(0.0, -0.0, -115.0),
        parkPos = vector3(-103.39474487305, 47.642402648926, 70.59383392334),
        deliverPos = vector3(-102.59525299072, 41.850532531738, 71.52693939209),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-543.61926269531, 314.62200927734, 82.020927429199),
        rot = vector3(0.0, 0.0, 84.999992370605),
        parkPos = vector3(-542.75946044922, 307.94702148438, 82.012351989746),
        deliverPos = vector3(-542.623046875, 314.53485107422, 83.020927429199),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-72.227012634277, 202.03268432617, 95.070419311523),
        rot = vector3(-3.8630464076996, 3.779045343399, -179.8724822998),
        parkPos = vector3(-77.177360534668, 205.19024658203, 95.057098388672),
        deliverPos = vector3(-72.229232788086, 203.0304107666, 96.137794494629),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(540.6533203125, -147.37475585938, 57.431003570557),
        rot = vector3(0.0, -0.0, -179.99998474121),
        parkPos = vector3(537.73736572266, -141.50180053711, 57.81090927124),
        deliverPos = vector3(540.6533203125, -146.37475585938, 58.431003570557),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(296.86480712891, -323.25, 44.019973754883),
        rot = vector3(-0.0, -0.0, -19.999996185303),
        parkPos = vector3(300.03012084961, -329.70309448242, 43.919857025146),
        deliverPos = vector3(296.52279663086, -324.18969726563, 45.019973754883),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(300.47906494141, -601.66668701172, 42.373783111572),
        rot = vector3(-0.0, -0.0, -21.999996185303),
        parkPos = vector3(297.12203979492, -607.30712890625, 42.358261108398),
        deliverPos = vector3(300.10446166992, -602.59387207031, 43.373783111572),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(430.56024169922, -1120.9622802734, 28.418531417847),
        rot = vector3(0.0, -0.0, -0.0),
        parkPos = vector3(424.44116210938, -1123.0285644531, 28.418235778809),
        deliverPos = vector3(430.56024169922, -1121.9622802734, 29.418531417847),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(235.76658630371, -1474.1400146484, 28.161823272705),
        rot = vector3(0.0, -0.0, 139.99998474121),
        parkPos = vector3(234.01895141602, -1467.4934082031, 28.287393569946),
        deliverPos = vector3(236.40937805176, -1473.3740234375, 29.161823272705),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-17.030691146851, -1683.1724853516, 28.297733306885),
        rot = vector3(0.0, 0.0, 21.999996185303),
        parkPos = vector3(-10.957441329956, -1685.0936279297, 28.300973892212),
        deliverPos = vector3(-16.656084060669, -1684.099609375, 29.297733306885),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-238.48066711426, -1467.7279052734, 30.513326644897),
        rot = vector3(0.0, 0.0, 21.999996185303),
        parkPos = vector3(-233.3331451416, -1471.3813476563, 30.505187988281),
        deliverPos = vector3(-238.10606384277, -1468.6550292969, 31.513326644897),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-83.007720947266, -1321.8780517578, 28.248613357544),
        rot = vector3(0.0, -0.0, -179.99998474121),
        parkPos = vector3(-77.694648742676, -1319.8520507813, 28.136016845703),
        deliverPos = vector3(-83.007720947266, -1320.8780517578, 29.248613357544),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-296.01901245117, -1304.72265625, 30.306371688843),
        rot = vector3(0.0, -0.0, 90.0),
        parkPos = vector3(-293.06829833984, -1298.4132080078, 30.133617401123),
        deliverPos = vector3(-295.01901245117, -1304.72265625, 31.306371688843),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-509.82083129883, -1763.2127685547, 20.258399963379),
        rot = vector3(-0.0, -0.0, -14.999998092651),
        parkPos = vector3(-516.61895751953, -1763.8173828125, 20.374977111816),
        deliverPos = vector3(-510.07965087891, -1764.1787109375, 21.258399963379),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-678.88104248047, -1199.6795654297, 9.8129863739014),
        rot = vector3(0.0, 0.0, 38.999996185303),
        parkPos = vector3(-672.43865966797, -1199.3032226563, 9.6126337051392),
        deliverPos = vector3(-678.25170898438, -1200.4566650391, 10.812986373901),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-724.67578125, -1064.4609375, 11.48849773407),
        rot = vector3(0.0, -0.0, -149.0),
        parkPos = vector3(-722.87475585938, -1059.5615234375, 11.39639377594),
        deliverPos = vector3(-725.19079589844, -1063.6037597656, 12.48849773407),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-948.27630615234, -2703.8247070313, 12.831039428711),
        rot = vector3(-0.0, -0.0, -28.999998092651),
        parkPos = vector3(-954.71350097656, -2703.0375976563, 12.831039428711),
        deliverPos = vector3(-948.76110839844, -2704.69921875, 13.831039428711),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-624.74139404297, -1667.6108398438, 24.974956512451),
        rot = vector3(0.0, -0.0, -120.0),
        parkPos = vector3(-627.08715820313, -1661.6004638672, 24.825067520142),
        deliverPos = vector3(-625.607421875, -1667.1108398438, 25.974956512451),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(800.73864746094, -945.51049804688, 24.855363845825),
        rot = vector3(8.3590955734253, 0.013185524381697, -90.0009765625),
        parkPos = vector3(797.90673828125, -940.26971435547, 24.535182952881),
        deliverPos = vector3(799.74926757813, -945.51049804688, 25.709987640381),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(781.5810546875, -1272.7689208984, 25.385303497314),
        rot = vector3(0.0, -0.0, 90.0),
        parkPos = vector3(785.34985351563, -1278.9416503906, 25.366081237793),
        deliverPos = vector3(782.5810546875, -1272.7689208984, 26.385303497314),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(785.53216552734, -1765.5895996094, 28.317956924438),
        rot = vector3(0.0, -0.0, 174.99998474121),
        parkPos = vector3(791.78063964844, -1763.4807128906, 28.315980911255),
        deliverPos = vector3(785.61932373047, -1764.5933837891, 29.317956924438),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(783.25225830078, -2263.9877929688, 28.45499420166),
        rot = vector3(-0.0, -0.0, -84.0),
        parkPos = vector3(780.07006835938, -2269.3742675781, 28.228761672974),
        deliverPos = vector3(782.25775146484, -2264.0922851563, 29.45499420166),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(936.92144775391, -2157.6193847656, 29.526178359985),
        rot = vector3(0.0, -0.0, -95.0),
        parkPos = vector3(934.03979492188, -2163.2126464844, 29.514316558838),
        deliverPos = vector3(935.92523193359, -2157.5322265625, 30.526178359985),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(1194.1612548828, -1408.6589355469, 34.364250183105),
        rot = vector3(0.0, -0.0, 90.0),
        parkPos = vector3(1196.5151367188, -1414.2209472656, 34.224296569824),
        deliverPos = vector3(1195.1612548828, -1408.6589355469, 35.364250183105),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(1222.7247314453, -1296.7158203125, 34.366889953613),
        rot = vector3(0.0, -0.0, 175.99998474121),
        parkPos = vector3(1228.4632568359, -1296.0, 34.102882385254),
        deliverPos = vector3(1222.7944335938, -1295.7182617188, 35.366889953613),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(1110.9614257813, -352.23065185547, 66.004203796387),
        rot = vector3(0.0, 0.0, 35.000003814697),
        parkPos = vector3(1119.6737060547, -351.77908325195, 66.043128967285),
        deliverPos = vector3(1111.5350341797, -353.0498046875, 67.004203796387),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(1239.703125, -346.93258666992, 68.082168579102),
        rot = vector3(0.0, -0.0, 168.0),
        parkPos = vector3(1234.8891601563, -343.75308227539, 68.080345153809),
        deliverPos = vector3(1239.9110107422, -345.95443725586, 69.082168579102),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(810.58807373047, -91.396339416504, 79.599006652832),
        rot = vector3(0.0, -0.0, 149.99998474121),
        parkPos = vector3(815.33392333984, -89.620552062988, 79.603225708008),
        deliverPos = vector3(811.08807373047, -90.530311584473, 80.599006652832),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(1203.7612304688, 2715.1616210938, 37.004322052002),
        rot = vector3(0.0, -0.0, 90.000007629395),
        parkPos = vector3(1207.1546630859, 2710.1420898438, 37.004962921143),
        deliverPos = vector3(1204.7612304688, 2715.1616210938, 38.004322052002),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(1017.7088012695, 2670.5385742188, 38.636299133301),
        rot = vector3(0.0, -0.0, 90.0),
        parkPos = vector3(1020.6460571289, 2666.9426269531, 38.557765960693),
        deliverPos = vector3(1018.7088012695, 2670.5385742188, 39.636299133301),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(609.27374267578, 2746.1713867188, 40.982307434082),
        rot = vector3(0.0, 0.0, 3.9999988079071),
        parkPos = vector3(607.42095947266, 2738.4697265625, 40.931243896484),
        deliverPos = vector3(609.34350585938, 2745.173828125, 41.982307434082),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(1558.2122802734, 3798.1508789063, 33.105587005615),
        rot = vector3(0.0, 0.0, 25.000001907349),
        parkPos = vector3(1563.3508300781, 3797.4262695313, 33.114646911621),
        deliverPos = vector3(1558.6348876953, 3797.2446289063, 34.105587005615),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(1994.3404541016, 3778.9633789063, 31.180801391602),
        rot = vector3(0.0, 0.0, 30.0),
        parkPos = vector3(1991.0090332031, 3775.0017089844, 31.180801391602),
        deliverPos = vector3(1994.8404541016, 3778.0974121094, 32.180801391602),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(1626.0091552734, 3555.599609375, 34.32022857666),
        rot = vector3(0.0, -0.0, 118.99999237061),
        parkPos = vector3(1625.6956787109, 3561.1882324219, 34.233688354492),
        deliverPos = vector3(1626.8837890625, 3556.0844726563, 35.32022857666),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(2519.4152832031, 4119.4897460938, 37.630737304688),
        rot = vector3(0.0, -0.0, -115.99999237061),
        parkPos = vector3(2514.4135742188, 4117.8056640625, 37.590072631836),
        deliverPos = vector3(2518.5166015625, 4119.9282226563, 38.630737304688),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(50.317752838135, 6466.9453125, 30.425289154053),
        rot = vector3(0.0, 0.0, 45.0),
        parkPos = vector3(56.090545654297, 6468.5454101563, 30.425289154053),
        deliverPos = vector3(51.02486038208, 6466.23828125, 31.425289154053),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-252.68196105957, 6100.19140625, 30.378967285156),
        rot = vector3(0.0, -0.0, -135.0),
        parkPos = vector3(-250.20240783691, 6106.4887695313, 30.379106521606),
        deliverPos = vector3(-253.38906860352, 6100.8984375, 31.378967285156),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-227.71914672852, 6285.9731445313, 30.534561157227),
        rot = vector3(0.0, -0.0, -133.99998474121),
        parkPos = vector3(-229.49600219727, 6291.73046875, 30.4573097229),
        deliverPos = vector3(-228.43849182129, 6286.66796875, 31.534561157227),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(121.62129974365, 6584.0874023438, 30.934419631958),
        rot = vector3(0.0, -0.0, 135.0),
        parkPos = vector3(125.46901702881, 6590.435546875, 30.96208190918),
        deliverPos = vector3(122.3284072876, 6584.7944335938, 31.934419631958),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-427.13522338867, 5993.94140625, 30.490114212036),
        rot = vector3(0.0, 0.0, 45.0),
        parkPos = vector3(-420.15795898438, 5997.5883789063, 30.498332977295),
        deliverPos = vector3(-426.42813110352, 5993.234375, 31.490114212036),
        boxCount = boxCounts,
    },










    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-1414.2784423828, 65.150428771973, 51.31148147583),
        rot = vector3(-0.0, -0.0, -84.0),
        parkPos = vector3(-1417.4300537109, 59.422763824463, 51.343860626221),
        deliverPos = vector3(-1415.2729492188, 65.0458984375, 52.31148147583),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-1014.2030029297, 60.913501739502, 50.83922958374),
        rot = vector3(0.0, -0.0, 121.00001525879),
        parkPos = vector3(-1007.7784423828, 58.152877807617, 50.791759490967),
        deliverPos = vector3(-1013.3458251953, 61.428539276123, 51.83922958374),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-1262.3159179688, -606.10607910156, 26.177299499512),
        rot = vector3(0.0, 0.0, 36.0),
        parkPos = vector3(-1254.8076171875, -604.38714599609, 26.168704986572),
        deliverPos = vector3(-1261.7281494141, -606.91510009766, 27.177299499512),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-1675.1606445313, -506.5563659668, 36.959377288818),
        rot = vector3(0.0, -0.0, -128.99998474121),
        parkPos = vector3(-1682.0734863281, -508.91595458984, 36.827663421631),
        deliverPos = vector3(-1675.9377441406, -505.9270324707, 37.959377288818),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-1315.13671875, 380.54489135742, 68.950393676758),
        rot = vector3(0.0, -0.0, -166.0),
        parkPos = vector3(-1314.6389160156, 388.2038269043, 68.970199584961),
        deliverPos = vector3(-1315.3786621094, 381.51519775391, 69.950393676758),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-1961.2587890625, 531.13385009766, 108.94540405273),
        rot = vector3(5.7550029754639, 0.45303842425346, -19.022769927979),
        parkPos = vector3(-1956.0428466797, 527.28881835938, 108.69554901123),
        deliverPos = vector3(-1961.5831298828, 530.19323730469, 109.84513092041),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-1792.0216064453, 818.64642333984, 137.49920654297),
        rot = vector3(-0.0, -0.0, -46.0),
        parkPos = vector3(-1798.5760498047, 819.32476806641, 137.64825439453),
        deliverPos = vector3(-1792.7409667969, 817.95178222656, 138.49920654297),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-1131.3272705078, 567.72735595703, 101.10707855225),
        rot = vector3(0.0, -0.0, -0.0),
        parkPos = vector3(-1133.1372070313, 561.76635742188, 101.06958770752),
        deliverPos = vector3(-1131.3272705078, 566.72735595703, 102.10707855225),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-831.84240722656, 828.53619384766, 198.1488494873),
        rot = vector3(3.290415763855, -9.2805700302124, 20.267141342163),
        parkPos = vector3(-838.14196777344, 824.95245361328, 196.75436401367),
        deliverPos = vector3(-831.49658203125, 827.59967041016, 199.09144592285),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-406.38748168945, 543.97216796875, 121.67281341553),
        rot = vector3(-0.0, -0.0, -34.0),
        parkPos = vector3(-413.17526245117, 544.08154296875, 121.56130218506),
        deliverPos = vector3(-406.94668579102, 543.14312744141, 122.67281341553),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(-63.236511230469, 390.80010986328, 112.84671783447),
        rot = vector3(0.0, -0.0, 154.99998474121),
        parkPos = vector3(-62.214572906494, 399.64352416992, 112.19326782227),
        deliverPos = vector3(-62.813892364502, 391.70642089844, 113.84671783447),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(308.52432250977, -1856.8186035156, 25.908449172974),
        rot = vector3(0.0, -0.0, -128.99998474121),
        parkPos = vector3(304.94149780273, -1861.6469726563, 25.916311264038),
        deliverPos = vector3(307.74716186523, -1856.1893310547, 26.908449172974),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(402.52005004883, -2062.9350585938, 20.547849655151),
        rot = vector3(0.0, 0.0, 62.999996185303),
        parkPos = vector3(400.46981811523, -2069.9848632813, 19.911163330078),
        deliverPos = vector3(403.41107177734, -2063.3891601563, 21.547849655151),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(503.40908813477, -1768.3724365234, 27.501209259033),
        rot = vector3(-0.0, -0.0, -72.0),
        parkPos = vector3(497.70770263672, -1772.7554931641, 27.372438430786),
        deliverPos = vector3(502.45803833008, -1768.6813964844, 28.501209259033),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(1680.5037841797, 4965.5649414063, 41.41771697998),
        rot = vector3(-3.8965058326721, -1.8804461956024, 44.936023712158),
        parkPos = vector3(1681.4702148438, 4958.6953125, 41.67459487915),
        deliverPos = vector3(1681.2084960938, 4964.8588867188, 42.48567199707),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(2017.0802001953, 4966.0756835938, 40.390331268311),
        rot = vector3(0.0, 0.0, 41.999996185303),
        parkPos = vector3(2017.0826416016, 4959.5205078125, 40.533843994141),
        deliverPos = vector3(2017.7493896484, 4965.3325195313, 41.390331268311),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(2574.4143066406, 4689.7353515625, 33.104835510254),
        rot = vector3(0.0, -0.0, -139.0),
        parkPos = vector3(2570.9995117188, 4695.8110351563, 33.076789855957),
        deliverPos = vector3(2573.7583007813, 4690.490234375, 34.104835510254),
        boxCount = boxCounts,
    },

    {
        _id = GetUniqueId('POSTOP'),
        pos = vector3(2883.8837890625, 4489.580078125, 47.094539642334),
        rot = vector3(-0.0, -0.0, -21.999996185303),
        parkPos = vector3(2879.39453125, 4484.4799804688, 47.419338226318),
        deliverPos = vector3(2883.5092773438, 4488.6528320313, 48.094539642334),
        boxCount = boxCounts,
    },
}

for i = 1, #Config.MISSION_POST_OP.BOXES do
    local boxA = Config.MISSION_POST_OP.BOXES[i]

    for j = 1, #Config.MISSION_POST_OP.BOXES do
        local boxB = Config.MISSION_POST_OP.BOXES[j]

        if i ~= j then
            if #(boxA.parkPos - boxB.parkPos) < 55 then
                print("Box too close", boxA.parkPos, boxB.parkPos)
            end
        end
    end
end