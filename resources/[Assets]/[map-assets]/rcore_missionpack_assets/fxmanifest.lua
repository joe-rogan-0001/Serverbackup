fx_version 'cerulean'
lua54 'yes'
game "gta5"

author 'brofx'
description 'rcore_missionpack_assets'

version '1.0.0'

files {
      'rcorepostop.ytyp'
}

escrow_ignore {
      'stream/_manifest.ymf',
      'stream/brofx_postop_box.ydr',
      'stream/brofx_postop_box_ymap.ymap',
      'stream/rcorepostop.ytyp',
}

this_is_a_map "yes"

data_file 'DLC_ITYP_REQUEST' 'rcorepostop.ytyp'

dependency '/assetpacks'