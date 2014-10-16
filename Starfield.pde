Particle [] particlez;

void setup()
{
	size(700, 700);
	background(0);
	particlez = new Particle[100];
	for(int i = 0; i < particlez.length; i++)
	{
		particlez[i] = new NormalParticle();
	}
	((NormalParticle)particlez[0]).dSpeed = 10;
	particlez[particlez.length - 1] = new OddballParticle();
}
void draw()
{
	//if((int)((NormalParticle)particlez[0]).dX == 350 )
		// && (int)((NormalParticle)particlez[0]).dY ==  350)
    if(((NormalParticle)particlez[0]).dX - 350 < 2 && (((NormalParticle)particlez[0]).dY - 350) < 2 )
	{
			background(0);
	}

	for(int i = 0; i <particlez.length; i++)
	{
		particlez[i].move();
		particlez[i].show();
	}
}
class NormalParticle implements Particle
{
	double dX, dY, dTheta, dSpeed;
	NormalParticle()
		{
			dX = 350;
			dY = 350;
			dTheta = Math.random()*10*Math.PI;
			dSpeed = Math.random()*11;
		}
	public void move()
		{
			dX = dX + Math.cos(dTheta)*dSpeed;
			dY = dY + Math.sin(dTheta)*dSpeed;
			dTheta += 0.01 ;
		}
	public void show()
		{

			fill(200, 200, 200);
			ellipse((float)dX, (float)dY, (int)(Math.random()*4+2), (int)(Math.random()*4+2));
		}

}
interface Particle
{
	public void move();
	public void show();
}
class OddballParticle implements Particle
{
	double dXX, dYY, dTheta2, dSpeed2;
	OddballParticle()
	{
		dXX = 350;
		dYY = 350;
		dTheta2 = Math.random()*2*Math.PI;
		dSpeed2 = Math.random()*11;
	}
	public void move()
	{
		dXX = dXX + Math.cos(dTheta2)*dSpeed2;
		dYY = dYY + Math.sin(dTheta2)*dSpeed2;
		dTheta2 += 0.01;
	}
	public void show()
	{
			fill(255, 0, 222);
			ellipse((float)dXX, (float)dYY, 7, 7);
	}
}


