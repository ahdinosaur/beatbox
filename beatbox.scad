include <beatbeam.scad>
include <units.scad>

include <buttonbeam.scad>

module beatbox(x,y,z, custombutton)
{
	// x beams
	translate() xBeam(x);
	translate((y-1)*$beam_width*Y) xBeam(x);
	if (custombutton == 0)
	{
		translate(((y-1)*$beam_width)*Y+((z-1)*$beam_width)*Z) xBeam(x);
		translate(((z-1)*$beam_width)*Z) xBeam(x);
	} else {
		translate(9*$beam_width*Y+4*$beam_width*Z) buttonbeam();
		translate(10*$beam_width*X+$beam_width*Y+4*$beam_width*Z) rotate(180,0,0) buttonbeam();
	}
	// y beams
	translate($beam_width*X+$beam_width*Z) yBeam(y);
	translate(((x-2)*$beam_width)*X+$beam_width*Z) yBeam(y);
	translate($beam_width*X+((z-2)*$beam_width)*Z) yBeam(y);
	translate(((x-2)*$beam_width)*X+((z-2)*$beam_width)*Z) yBeam(y);
	// z beams
	translate($beam_width*Y) zBeam(z);
	translate(((y-2)*$beam_width)*Y) zBeam(z);
	translate(((x-1)*$beam_width)*X+$beam_width*Y) zBeam(z);
	translate(((x-1)*$beam_width)*X+((y-2)*$beam_width)*Y) zBeam(z);
}




module assembled()
{
	customtop = 1;
	union()
	{
		beatbox(10,10,5,custombutton=customtop);
		//translate(100*X) beatbox(10,10,5,custombutton=customtop);
		//translate(100*Y) beatbox(10,10,5,custombutton=customtop);
		//translate(100*(X+Y)) beatbox(10,10,5,custombutton=customtop);
	}
}

module raw()
{
	for (i = [0: 4])
	{
		translate(14*i*Y) xBeam(10);
	}
}

//raw();
assembled();