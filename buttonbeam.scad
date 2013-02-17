include <beatbeam.scad>
include <units.scad>

module beathole()
{
	union()
	{
		translate([$beam_width / 2, $beam_width + 1, $beam_width / 2 + epsilon])
		rotate([90,0,0])
		cylinder(r=$beam_hole_radius, h=$beam_width + 2, $fn=50);

		translate([$beam_width / 2, $beam_width / 2, -1])
		rotate([0,0,0])
		cylinder(r=$beam_hole_radius, h=$beam_width + 2, $fn=50);
	}
}

module customhole()
{
	union()
	{
		translate([$beam_width/2,$beam_width+1, $beam_width/2])
		rotate([90,0,0])
		cylinder(r=$beam_hole_radius, h=$beam_width + 2, $fn=50);

		translate([2.5,$beam_width-2.5, -1])
		rotate([0,0,0])
		cylinder(r=1.25+0.1, h=$beam_width + 2, $fn=50);
	}
}

module buttonbeam()
{
	difference()
	{
		cube([$beam_width * 10, $beam_width, $beam_width]);
		customhole();
		for (i = [1 : 3])
		{
			translate(i*$beam_width*X) beathole();
		}
		translate(5*$beam_width*X) mirror() customhole();
		translate(5*$beam_width*X) customhole();
		for (i = [6: 8])
		{
			translate(i*$beam_width*X) beathole();
		}
		translate(10*$beam_width*X) mirror() customhole();
	}
}

//buttonbeam();