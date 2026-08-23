package chat
{
   import §_-U19§.§_-m1L§;
   import com.api.Player;
   import protocol.§_-s2l§;
   import utils.§_-r1G§;
   
   public class §_-52l§ extends §_-S24§
   {
      
      public static const §_-K2r§:String = "#Ac";
      
      public static const §_-d1i§:String = "#Co";
      
      public var date:Date;
      
      private var §_-Ev§:int;
      
      private var §_-21f§:int;
      
      private var type:int;
      
      private var info:int;
      
      private var §_-I1T§:String;
      
      public function §_-52l§(param1:Player, param2:int, param3:int, param4:int, param5:int, param6:Date)
      {
         this.§_-Ev§ = Math.abs(param3);
         this.§_-21f§ = Math.abs(param4);
         this.date = param6;
         this.type = param2;
         this.info = param5;
         if(this.§_-Ev§ > 0)
         {
            this.§_-I1T§ = " " + this.§_-Ev§ + " " + §_-d1i§;
         }
         else
         {
            this.§_-I1T§ = " " + this.§_-21f§ + " " + §_-K2r§;
         }
         super(param1,this.§_-I1T§);
      }
      
      override public function get text() : String
      {
         var _loc1_:String = null;
         switch(this.type)
         {
            case §_-s2l§.§_-u2L§:
               if(this.player["id"] == Game.selfId)
               {
                  return §_-r1G§.span(gls("Ты внёс {0}",this.§_-I1T§),"message");
               }
               return §_-hB§() + §_-r1G§.span(gls(" внёс {0}",this.§_-I1T§),"message");
               break;
            case §_-s2l§.§_-d1G§:
               return §_-r1G§.span(gls("Имя клана изменено за {0}",this.§_-I1T§),"message");
            case §_-s2l§.§_-C18§:
               _loc1_ = this.player["id"] == Game.selfId ? gls("Ты ") : §_-hB§();
               _loc1_ += gls("{0}{1} за {2}",§_-m1L§.§_-13l§(this.info) ? gls(" купил район №") : gls(" покупал район №"),this.info,this.§_-I1T§);
               return §_-r1G§.span(_loc1_,"message");
            case §_-s2l§.§_-12§:
               _loc1_ = this.player["id"] == Game.selfId ? gls("Ты ") : §_-hB§();
               _loc1_ += gls("купил 5 мест за {0}",this.§_-I1T§);
               return §_-r1G§.span(_loc1_,"message");
            case §_-s2l§.§_-b2o§:
               _loc1_ = this.player["id"] == Game.selfId ? gls("Ты ") : §_-hB§();
               _loc1_ += gls("купил ускоренную прокачку за {0}",this.§_-I1T§);
               return §_-r1G§.span(_loc1_,"message");
            case §_-s2l§.§_-j2v§:
               _loc1_ = this.player["id"] == Game.selfId ? gls("Ты ") : §_-hB§();
               _loc1_ += gls("купил слот для тотема на 24 часа за {0}",this.§_-I1T§);
               return §_-r1G§.span(_loc1_,"message");
            default:
               return §_-r1G§.span(gls("С вашего клана снята дань в размере {0}",this.§_-I1T§),"message");
         }
      }
   }
}

