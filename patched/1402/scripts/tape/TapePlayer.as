package tape
{
   import §_-S1n§.§_-73§;
   import §_-a11§.§_-h2m§;
   import com.api.Player;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import utils.§_-33I§;
   import views.§_-F1V§;
   import views.§_-K1S§;
   import views.§_-i12§;
   
   public class TapePlayer extends §_-QN§
   {
      
      public static const §_-ka§:int = 0;
      
      public static const §_-ri§:int = 1;
      
      public static const §_-M1a§:int = 2;
      
      private static const §_-730§:uint = §_-Y2E§.§_-n2H§ | §_-Y2E§.§_-rC§ | §_-Y2E§.§_-s10§;
      
      public var player:Player = null;
      
      public var playerId:int;
      
      protected var §_-n12§:§_-I2Z§;
      
      private var playerType:int = -1;
      
      private var §_-W2C§:Boolean = false;
      
      private var §_-hI§:uint = 0;
      
      private var §_-i1y§:int = -1;
      
      private var §_-U16§:§_-73§ = null;
      
      public function TapePlayer(param1:int, param2:int = 0)
      {
         super();
         this.playerId = param1;
         this.playerType = param2;
         this.player = Game.getPlayer(this.playerId);
         switch(this.playerType)
         {
            case §_-ka§:
               if(param1 == Game.selfId)
               {
                  this.§_-n12§ = new §_-F1V§(new TopSelfFrame());
               }
               else
               {
                  this.§_-n12§ = new §_-F1V§(new TopFrame());
               }
               this.§_-U16§ = new §_-73§(this,"","","");
               this.§_-hI§ = §_-z1W§.§_-TW§;
               break;
            case §_-ri§:
               this.§_-n12§ = new §_-i12§();
               this.§_-hI§ = §_-O2t§.§_-TW§;
               break;
            case §_-M1a§:
               this.§_-n12§ = new §_-K1S§(new TopFrame());
               this.§_-hI§ = §_-Y2E§.§_-W1l§;
         }
         this.player.addEventListener(this.§_-hI§,this.§_-Y16§);
         this.player.addEventListener(§_-730§,this.§_-Y16§);
         (this.§_-n12§ as Sprite).addEventListener(MouseEvent.MOUSE_OVER,this.§_-Ur§,false,100);
         addChild(this.§_-n12§ as Sprite);
      }
      
      override public function get loaded() : Boolean
      {
         return this.player != null;
      }
      
      override public function §_-O1s§() : void
      {
         if(this.§_-W2C§)
         {
            return;
         }
         this.§_-W2C§ = true;
         Game.request(this.playerId,§_-730§);
      }
      
      public function §_-gN§(param1:int) : void
      {
         if(this.playerType != §_-ka§)
         {
            return;
         }
         switch(param1)
         {
            case 1:
               (this.§_-n12§ as §_-F1V§).§_-vP§(new TopGoldenFrame());
               break;
            case 2:
               (this.§_-n12§ as §_-F1V§).§_-vP§(new TopSilverFrame());
               break;
            case 3:
               (this.§_-n12§ as §_-F1V§).§_-vP§(new TopBronzeFrame());
               break;
            case -1:
               if(this.playerId == Game.selfId)
               {
                  (this.§_-n12§ as §_-F1V§).§_-vP§(new TopSelfFrame());
               }
               else
               {
                  (this.§_-n12§ as §_-F1V§).§_-vP§(new TopFrame());
               }
         }
      }
      
      public function set §_-nE§(param1:int) : void
      {
         if(this.playerType != §_-ka§)
         {
            return;
         }
         this.§_-i1y§ = param1;
      }
      
      protected function §_-Y16§(param1:Player) : void
      {
         if(this.§_-W2C§)
         {
            this.§_-n12§.§_-63H§(param1);
         }
         if(!this.§_-n12§.§_-o2c§(this.player))
         {
            return;
         }
         §_-p2U§.add("TapePlayer.setPlayer for player id " + this.playerId);
         this.§_-n12§.§_-yC§(this.player);
         dispatchEvent(new §_-h2m§(this,§_-h2m§.CHANGED));
      }
      
      private function §_-Ur§(param1:MouseEvent) : void
      {
         this.parent.setChildIndex(this,parent.numChildren - 1);
         if(this.player == null)
         {
            return;
         }
         if(this.playerType != §_-ka§ || this.player["exp"] == null)
         {
            return;
         }
         var _loc2_:String = "";
         if("name" in this.player)
         {
            _loc2_ = this.player.name;
         }
         if(§_-33I§.§_-V1O§(this.player.rights,§_-33I§.§_-42W§))
         {
            _loc2_ += " [A]";
         }
         else if(§_-33I§.§_-V1O§(this.player.rights,§_-33I§.§_-AJ§))
         {
            _loc2_ += " [M]";
         }
         this.§_-U16§.load(_loc2_,this.player["exp"].toString(),this.§_-i1y§.toString());
      }
   }
}

