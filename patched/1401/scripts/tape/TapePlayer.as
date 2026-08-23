package tape
{
   import §_-e1G§.§_-m3§;
   import §_-r2Y§.§_-33e§;
   import com.api.Player;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import utils.§_-c10§;
   import views.§_-124§;
   import views.§_-W2c§;
   import views.§_-cU§;
   
   public class TapePlayer extends §_-K2k§
   {
      
      public static const §_-839§:int = 0;
      
      public static const §_-ww§:int = 1;
      
      public static const §_-sf§:int = 2;
      
      private static const §_-j17§:uint = §_-hF§.§_-31q§ | §_-hF§.§_-k2y§ | §_-hF§.§_-31X§;
      
      public var player:Player = null;
      
      public var playerId:int;
      
      protected var §_-M18§:§_-U15§;
      
      private var playerType:int = -1;
      
      private var §_-y2p§:Boolean = false;
      
      private var §_-vE§:uint = 0;
      
      private var §_-w2z§:int = -1;
      
      private var §_-ht§:§_-m3§ = null;
      
      public function TapePlayer(param1:int, param2:int = 0)
      {
         super();
         this.playerId = param1;
         this.playerType = param2;
         this.player = Game.getPlayer(this.playerId);
         switch(this.playerType)
         {
            case §_-839§:
               if(param1 == Game.selfId)
               {
                  this.§_-M18§ = new §_-cU§(new TopSelfFrame());
               }
               else
               {
                  this.§_-M18§ = new §_-cU§(new TopFrame());
               }
               this.§_-ht§ = new §_-m3§(this,"","","");
               this.§_-vE§ = §_-DO§.§_-12F§;
               break;
            case §_-ww§:
               this.§_-M18§ = new §_-124§();
               this.§_-vE§ = §_-M1Z§.§_-12F§;
               break;
            case §_-sf§:
               this.§_-M18§ = new §_-W2c§(new TopFrame());
               this.§_-vE§ = §_-hF§.§_-B3k§;
         }
         this.player.addEventListener(this.§_-vE§,this.§_-P9§);
         this.player.addEventListener(§_-j17§,this.§_-P9§);
         (this.§_-M18§ as Sprite).addEventListener(MouseEvent.MOUSE_OVER,this.§_-lu§,false,100);
         addChild(this.§_-M18§ as Sprite);
      }
      
      override public function get loaded() : Boolean
      {
         return this.player != null;
      }
      
      override public function §_-027§() : void
      {
         if(this.§_-y2p§)
         {
            return;
         }
         this.§_-y2p§ = true;
         Game.request(this.playerId,§_-j17§);
      }
      
      public function §_-7m§(param1:int) : void
      {
         if(this.playerType != §_-839§)
         {
            return;
         }
         switch(param1)
         {
            case 1:
               (this.§_-M18§ as §_-cU§).§_-p1Z§(new TopGoldenFrame());
               break;
            case 2:
               (this.§_-M18§ as §_-cU§).§_-p1Z§(new TopSilverFrame());
               break;
            case 3:
               (this.§_-M18§ as §_-cU§).§_-p1Z§(new TopBronzeFrame());
               break;
            case -1:
               if(this.playerId == Game.selfId)
               {
                  (this.§_-M18§ as §_-cU§).§_-p1Z§(new TopSelfFrame());
               }
               else
               {
                  (this.§_-M18§ as §_-cU§).§_-p1Z§(new TopFrame());
               }
         }
      }
      
      public function set §_-C2v§(param1:int) : void
      {
         if(this.playerType != §_-839§)
         {
            return;
         }
         this.§_-w2z§ = param1;
      }
      
      protected function §_-P9§(param1:Player) : void
      {
         if(this.§_-y2p§)
         {
            this.§_-M18§.§_-q1C§(param1);
         }
         if(!this.§_-M18§.§_-51I§(this.player))
         {
            return;
         }
         §_-TQ§.add("TapePlayer.setPlayer for player id " + this.playerId);
         this.§_-M18§.§_-031§(this.player);
         dispatchEvent(new §_-33e§(this,§_-33e§.CHANGED));
      }
      
      private function §_-lu§(param1:MouseEvent) : void
      {
         this.parent.setChildIndex(this,parent.numChildren - 1);
         if(this.player == null)
         {
            return;
         }
         if(this.playerType != §_-839§ || this.player["exp"] == null)
         {
            return;
         }
         var _loc2_:String = "";
         if("name" in this.player)
         {
            _loc2_ = this.player.name;
         }
         if(§_-c10§.§_-73j§(this.player.rights,§_-c10§.§_-MR§))
         {
            _loc2_ += " [A]";
         }
         else if(§_-c10§.§_-73j§(this.player.rights,§_-c10§.§_-639§))
         {
            _loc2_ += " [M]";
         }
         this.§_-ht§.load(_loc2_,this.player["exp"].toString(),this.§_-w2z§.toString());
      }
   }
}

