package §_-Yb§
{
   import §_-D1c§.§_-9U§;
   import §_-D1c§.§_-N2T§;
   import §_-D1c§.§_-Y2K§;
   import §_-D1c§.§_-c1n§;
   import utils.§_-c10§;
   
   public class §_-dg§ extends §_-h10§
   {
      
      public function §_-dg§()
      {
         super();
         §_-XG§(new §_-Y2K§(gls("Течение {0}","(velocity)"),"velocity",Game.§_-x2P§));
         §_-XG§(new §_-c1n§(gls("Коэффициент пузырения {0}","(bubblingFactor)"),"bubblingFactor",1,0,0.5));
         §_-XG§(new §_-N2T§(gls("Разрешено плавать {0}","(allowSwim)"),"allowSwim"));
         §_-XG§(new §_-9U§(gls("Цвет {0} {1}",1,"(color0)"),"color0"));
         §_-XG§(new §_-9U§(gls("Цвет {0} {1}",2,"(color1)"),"color1"));
         §_-XG§(new §_-9U§(gls("Цвет {0} {1}",3,"(color2)"),"color2"));
         if(§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-C2Y§))
         {
            §_-XG§(new §_-N2T§(gls("Волны вкл. {0}","(waveEnabled)"),"waveEnabled"));
            §_-XG§(new §_-c1n§(gls("Длина Волны {0}","(waveLength)"),"waveLength"));
            §_-XG§(new §_-c1n§(gls("Амплитуда {0}","(waveAmplitude)"),"waveAmplitude"));
            §_-XG§(new §_-c1n§(gls("Кол-во связей {0}","(particlesCount)"),"particlesCount"));
         }
      }
   }
}

