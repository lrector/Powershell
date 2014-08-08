GLOBAL_MAPPER_SCRIPT VERSION="1.00" FILENAME="D:\ImageSource\NE\Kearney\20140305_KearneyNE_2013\Kearney.gmw"
SET_BG_COLOR COLOR="RGB(157,157,157)"
UNLOAD_ALL
IMPORT FILENAME="D:\ImageSource\NE\Kearney\20140305_KearneyNE_2013\NEBUFF026019.sid" \
	 TYPE="MRSID" LABEL_FIELD_FORCE_OVERWRITE="NO" SAMPLING_METHOD="NEAREST_NEIGHBOR" \
	 AUTO_CONTRAST="NO" CONTRAST_SHARED="YES" CONTRAST_MODE="NONE" CLIP_COLLAR="NONE" \
	 TEXTURE_MAP="NO" TRANSPARENT_COLOR="RGB(255,255,255)" TRANSPARENT_COLOR_DIST="10"
IMPORT FILENAME="D:\ImageSource\NE\Kearney\20140305_KearneyNE_2013\NEBUFF026029.sid" \
	 TYPE="MRSID" LABEL_FIELD_FORCE_OVERWRITE="NO" SAMPLING_METHOD="NEAREST_NEIGHBOR" \
	 AUTO_CONTRAST="NO" CONTRAST_SHARED="YES" CONTRAST_MODE="NONE" CLIP_COLLAR="NONE" \
	 TEXTURE_MAP="NO" TRANSPARENT_COLOR="RGB(255,255,255)" TRANSPARENT_COLOR_DIST="10"
DEFINE_PROJ PROJ_NAME="MERCAT_GOOGLE_MAPS_SPHERE_RADIUS_6378137"
Projection     MERCATOR
Datum          D_WGS_1984_MAJOR_AUXILIARY_SPHERE
Zunits         NO
Units          METERS
Xshift         0.000000
Yshift         0.000000
Parameters
1.000000000 /* scale factor at central meridian

0 0 0.00000 /* central meridian

0 0 0.00000 /* latitude of the origin

0.0000 /* false easting (meters)

0.0000 /* false northing (meters)

END_DEFINE_PROJ
LOAD_PROJECTION PROJ_NAME="MERCAT_GOOGLE_MAPS_SPHERE_RADIUS_6378137"
SET_VIEW GLOBAL_BOUNDS="-11057023.611,4956749.148,-10998872.791,4982273.594"

EXPORT_WEB FILENAME="f:\Tiles\Kearney01\R0-C1\map.htm" TYPE=VIRTUAL_EARTH MAX_ZOOM_LEVEL=20 NUM_ZOOM_LEVELS=1 IMAGE_FORMAT=JPG GLOBAL_BOUNDS="4981553.18897236,-11038472.998917,4975287.92188149,-11027702.7619317"
