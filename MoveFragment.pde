PShader shader;

float forw = 0.0;
boolean forY = false;
boolean forNY = false;
float sid = 0.0;
boolean sidX = false;
boolean sidNX = false;
float spa = 0.0;
boolean spac = false;
boolean spacD = false;
boolean con = false;
boolean sup = false;
float conX = 0.0;
float conY = 0.0;
float rotX = 0.0;
float rotY = 0.0;
float rate = 0.01;
float spee = 0.05;

void setup() {
  size(800, 450, P2D);
  noStroke();

  shader = loadShader("Move.glsl");
}

void draw() {
  
  shader.set("iResolution", float(width), float(height));
  shader.set("iMouse", rotX, rotY);
  shader.set("iTime", millis() / 1000.0);
  shader.set("iForward", forw);
  shader.set("iSide", sid);
  shader.set("iUp", spa);
  shader.set("iFractal", conX, conY);
  shader.set("iMSAA", sup);
  shader(shader);
  
  rect(0, 0, width, height);
  
  if( forY == true )
  {
  
    forw += spee;
  
  }
  
  if( forNY == true )
  {
  
    forw -= spee;
  
  }  
  
  if( sidX == true )
  {
  
    sid += spee;
  
  } 
  
  if( sidNX == true )
  {
  
    sid -= spee;
  
  }
  
  if( spac == true )
  {
  
    spa += spee;
  
  }  
  
  if( spacD == true )
  {
  
    spa -= spee;
  
  }
  
  //println( frameRate );
  
}

void keyPressed()
{

  if( key == 'w'|| key == 'W' )
  {
    
    forY = true;
  
  }
  
  if( key == 's'|| key == 'S' )
  {
  
    forNY = true;
  
  }
  
  if( key == 'd'|| key == 'D' )
  {
  
    sidX = true;
  
  }
  
  if( key == 'a'|| key == 'A' )
  {
  
    sidNX = true;
  
  }
  
  if( key == ' ' )
  {
  
    spac = true;
  
  }  
  
  if( key == CODED )
  {
  
    if( keyCode == SHIFT )
    {
      
      spacD = true;
    
    }
  
  } 
  
  if( key == CODED )
  {
  
    if( keyCode == CONTROL )
    {
      
      con = true;
    
    }
  
  } 
  
  if ( sup == false )
  {

    if ( key == 'm' || key == 'M' )
    {

      sup = true;
      println( str( sup ) );
      
    }
    
  } 
  
  else if ( sup == true )
  {

    if ( key == 'm' || key == 'M' )
    {

      sup = false;
      println( str( sup ) );
      
    }
    
  }

}

void keyReleased()
{

  if( key == 'w'|| key == 'W' )
    {
    
      forY = false;
    
    }
    
    if( key == 's'|| key == 'S' )
    {
    
      forNY = false;
    
    }
    
    if( key == 'd'|| key == 'D' )
    {
    
      sidX = false;
    
    }
    
    if( key == 'a'|| key == 'A' )
    {
    
      sidNX = false;
    
    }
    
    if( key == ' ' )
    {
  
      spac = false;
  
    }   
    
    if( key == CODED )
    {
    
      if( keyCode == SHIFT )
      {
        
        spacD = false;
      
      }
      
    } 
    
    if( key == CODED )
    {
    
      if( keyCode == CONTROL )
      {
        
        con = false;
      
      }
    
    }

}

void mouseDragged() {
  
  if( con == false )
  {
  
    rotX += (pmouseY-mouseY) * rate;
    rotY += (mouseX-pmouseX) * rate;
    
  }
  
  else
  {
    
    conX += (pmouseY-mouseY) * rate;
    conY += (mouseX-pmouseX) * rate; 
    
  }
  
}
