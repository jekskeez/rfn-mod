package §_-d24§
{
   import §_-42I§.§_-11n§;
   import §_-42I§.§_-i22§;
   import §_-42I§.§_-l1Z§;
   import §_-42I§.§_-u2y§;
   import utils.§_-33I§;
   
   public class §_-C3M§ extends §_-eA§
   {
      
      public function §_-C3M§()
      {
         super();
         §_-X2r§(new §_-u2y§(gls("Течение {0}","(velocity)"),"velocity",Game.§_-12A§));
         §_-X2r§(new §_-11n§(gls("Коэффициент пузырения {0}","(bubblingFactor)"),"bubblingFactor",1,0,0.5));
         §_-X2r§(new §_-i22§(gls("Разрешено плавать {0}","(allowSwim)"),"allowSwim"));
         §_-X2r§(new §_-l1Z§(gls("Цвет {0} {1}",1,"(color0)"),"color0"));
         §_-X2r§(new §_-l1Z§(gls("Цвет {0} {1}",2,"(color1)"),"color1"));
         §_-X2r§(new §_-l1Z§(gls("Цвет {0} {1}",3,"(color2)"),"color2"));
         if(§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-9F§))
         {
            §_-X2r§(new §_-i22§(gls("Волны вкл. {0}","(waveEnabled)"),"waveEnabled"));
            §_-X2r§(new §_-11n§(gls("Длина Волны {0}","(waveLength)"),"waveLength"));
            §_-X2r§(new §_-11n§(gls("Амплитуда {0}","(waveAmplitude)"),"waveAmplitude"));
            §_-X2r§(new §_-11n§(gls("Кол-во связей {0}","(particlesCount)"),"particlesCount"));
         }
      }
   }
}

