QBShared = QBShared or {}
QBShared.ForceJobDefaultDutyAtLogin = true -- true: Force duty state to jobdefaultDuty | false: set duty state from database last saved
QBShared.QBJobsStatus = false -- true: integrate qb-jobs into the whole of qb-core | false: treat qb-jobs as an add-on resource.
QBShared.Jobs = {} -- All of below has been migrated into qb-jobs
if QBShared.QBJobsStatus then return end
QBShared.Jobs = {
	['unemployed'] = {
		label = 'Civilian',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Freelancer',
                payment = 10
            },
        },
	},
	['police'] = { -- start of police departments
		label = 'Los Santos Police Department',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Cadet',
                payment = 30
            },
			['1'] = {
                name = 'Solo Cadet',
                payment = 50
            },
			['2'] = {
                name = 'Officer',
                payment = 80
            },
			['3'] = {
                name = 'Sr. Officer',
                payment = 90
            },
            ['4'] = {
                name = 'Corporal',
                payment = 100
            },
            ['5'] = {
                name = 'Sergeant',
                payment = 105
            },
            ['6'] = {
                name = 'Lieutenant',
                payment = 125
            },
            ['7'] = {
                name = 'Captain',
                payment = 135
            },
			['8'] = {
                name = 'Assistant Chief of Police',
				isboss = true,
                payment = 145
            },
            ['9'] = {
                name = 'Chief of Police',
				isboss = true,
                payment = 155,
				bankAuth = true
            },
        },
	},
	['bcso'] = { -- start of police departments
		label = 'Sherif Department',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Rookie',
                payment = 30
            },
			['1'] = {
                name = 'Solo Rookie',
                payment = 50
            },
			['2'] = {
                name = 'Snr. Sherif',
                payment = 100
            },
			['3'] = {
                name = 'Chief Deputy Sheriff',
                payment = 125,
				bankAuth = true
            },
			['4'] = {
                name = 'Sheriff',
                payment = 155,
				bankAuth = true
            },
        },
	},
	['ambulance'] = {
		label = 'EMS',
        type = 'ems',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
			['1'] = {
                name = 'Paramedic',
                payment = 75
            },
			['2'] = {
                name = 'Doctor',
                payment = 100
            },
			['3'] = {
                name = 'Surgeon',
                payment = 125
            },
			['4'] = {
                name = 'Chief',
				isboss = true,
                payment = 150,
                bankAuth = true
            },
        },
	},
	['realestate'] = {
		label = 'Real Estate',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
            },
			['1'] = {
                name = 'House Sales',
            },
			['2'] = {
                name = 'Business Sales',
            },
			['3'] = {
                name = 'Broker',
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                bankAuth = true
            },
        },
	},
	['cardealer'] = {
		label = 'Vehicle Dealer',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
            },
			['1'] = {
                name = 'Showroom Sales',
            },
			['2'] = {
                name = 'Business Sales',
            },
			['3'] = {
                name = 'Finance',
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                bankAuth = true
            },
        },
	},
	['tuner'] = {
	    label = 'Bennys',
	    defaultDuty = false,
	    offDutyPay = false,
	    grades = {
	        ['0'] = {
	            name = 'Recruit',
	        },
	        ['1'] = {
	            name = 'Mechanic',
	        },
	        ['2'] = {
	            name = 'Vehicle Sales',
	        },
	        ['3'] = {
	            name = 'Manager',
	            isboss = true,
	        },
	        ['4'] = {
	            name = 'CEO',
	            isboss = true,
	            bankAuth = true
	        },
	    },
	},
	['catcafe'] = {
		label = 'Cat Cafe',
		defaultDuty = true,
		grades = {
            ['0'] = {
				name = 'Recruit',
			},
			['1'] = {
				name = 'Novice',
			},
			['2'] = {
				name = 'Experienced',
			},
			['3'] = {
				name = 'Advanced',
			},
			['4'] = {
				name = 'Manager',
			 	isboss = true,
				bankAuth = true,
			},
        },
	},
	['judge'] = {
		label = 'Judge',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Judge',
            },
        },
	},
	['lawyer'] = {
		label = 'Lawyer',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Lawyer',
            },
        },
	},
	['casino'] = {
		label = 'Casino',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Worker',
            },
            ['1'] = {
                name = 'Boss',
				isboss = true,
                bankAuth = true
            },
        },
	},
}
