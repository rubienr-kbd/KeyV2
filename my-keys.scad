// the point of this file is to be a sort of DSL for constructing keycaps.
// when you create a method chain you are just changing the parameters
// key.scad uses, it doesn't generate anything itself until the end. This
// lets it remain easy to use key.scad like before (except without key profiles)
// without having to rely on this file. Unfortunately that means setting tons of
// special variables, but that's a limitation of SCAD we have to work around

include <./includes.scad>

module draw()
{

  $stem_support_type = is_undef(ssupport)  ? "disable"    : ssupport;
  $stem_type         = is_undef(stype)     ? "box_cherry" : stype;
  $stem_slop         = is_undef(sslop)     ? 0.35         : sslop;
  $support_type      = is_undef(support)   ? "flared"     : support;
                                                         
  rows_from          = is_undef(rows_from) ? 0            : rows_from;
  rows_to            = is_undef(rows_to)   ? 5            : rows_to;
  $key_profile       = is_undef(kprofile)  ? "sa"         : kprofile;
  $key_length        = is_undef(length)    ? 1            : length;
  $key_height        = is_undef(kheight)   ? 1            : kheight;
  $wall_thickness    = is_undef(thickness) ? 2            : thickness;
  $cherry_bevel      = is_undef(cbevel)    ? true         : cbevel;
  $corner_radius     = is_undef(cradius)   ? 2            : cradius;
                                                         
  $dish_type         = is_undef(dtype)     ? "disable"   : dtype;
  $key_bump          = is_undef(cbump)     ? false        : cbump;
  
  // example key
  //dcs_row(5) legend("A", size=9) key(stem_support_type=disabled);
  
  // example row
  for (x = [rows_from:1:rows_to]) {
    translate_u(0,-x) dcs_row(x) key();
  } 
  
  // example layout
  //preonic_default("dcs");
}

draw();
