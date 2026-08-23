package chat
{
   import §_-dc§.§_-X1g§;
   import com.api.Player;
   import protocol.§_-S2I§;
   import utils.§_-xb§;
   
   public class §_-3y§ extends §_-ao§
   {
      
      public static const §_-f2V§:String = "#Ac";
      
      public static const §_-K2n§:String = "#Co";
      
      public var date:Date;
      
      private var §_-83c§:int;
      
      private var §_-r3§:int;
      
      private var type:int;
      
      private var info:int;
      
      private var §_-pQ§:String;
      
      public function §_-3y§(param1:Player, param2:int, param3:int, param4:int, param5:int, param6:Date)
      {
         this.§_-83c§ = Math.abs(param3);
         this.§_-r3§ = Math.abs(param4);
         this.date = param6;
         this.type = param2;
         this.info = param5;
         if(this.§_-83c§ > 0)
         {
            this.§_-pQ§ = " " + this.§_-83c§ + " " + §_-K2n§;
         }
         else
         {
            this.§_-pQ§ = " " + this.§_-r3§ + " " + §_-f2V§;
         }
         super(param1,this.§_-pQ§);
      }
      
      override public function get text() : String
      {
         var _loc1_:String = null;
         switch(this.type)
         {
            case §_-S2I§.§_-m1v§:
               if(this.player["id"] == Game.selfId)
               {
                  return §_-xb§.span(gls("Ты внёс {0}",this.§_-pQ§),"message");
               }
               return §_-uc§() + §_-xb§.span(gls(" внёс {0}",this.§_-pQ§),"message");
               break;
            case §_-S2I§.§_-73F§:
               return §_-xb§.span(gls("Имя клана изменено за {0}",this.§_-pQ§),"message");
            case §_-S2I§.§_-t28§:
               _loc1_ = this.player["id"] == Game.selfId ? gls("Ты ") : §_-uc§();
               _loc1_ += gls("{0}{1} за {2}",§_-X1g§.§_-l29§(this.info) ? gls(" купил район №") : gls(" покупал район №"),this.info,this.§_-pQ§);
               return §_-xb§.span(_loc1_,"message");
            case §_-S2I§.§_-G2o§:
               _loc1_ = this.player["id"] == Game.selfId ? gls("Ты ") : §_-uc§();
               _loc1_ += gls("купил 5 мест за {0}",this.§_-pQ§);
               return §_-xb§.span(_loc1_,"message");
            case §_-S2I§.§_-33d§:
               _loc1_ = this.player["id"] == Game.selfId ? gls("Ты ") : §_-uc§();
               _loc1_ += gls("купил ускоренную прокачку за {0}",this.§_-pQ§);
               return §_-xb§.span(_loc1_,"message");
            case §_-S2I§.§_-X2B§:
               _loc1_ = this.player["id"] == Game.selfId ? gls("Ты ") : §_-uc§();
               _loc1_ += gls("купил слот для тотема на 24 часа за {0}",this.§_-pQ§);
               return §_-xb§.span(_loc1_,"message");
            default:
               return §_-xb§.span(gls("С вашего клана снята дань в размере {0}",this.§_-pQ§),"message");
         }
      }
   }
}

