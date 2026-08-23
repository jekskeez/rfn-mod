package game.mainGame
{
   import §_-T2y§.§_-92z§;
   import chat.§_-A1n§;
   import flash.display.Sprite;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import utils.§_-AR§;
   
   public class §_-c16§ extends Sprite
   {
      
      private static const §_-A1k§:int = 10;
      
      private static const §_-d1f§:int = 5;
      
      public static const §_-L19§:int = -20;
      
      public static const §_-G17§:int = -120;
      
      private var §_-vR§:§_-AR§ = new §_-AR§();
      
      public var §_-Kq§:int = 0;
      
      public var reportedPlayerId:int = 0;
      
      public var §_-f2W§:Vector.<int> = new Vector.<int>();
      
      public function §_-c16§()
      {
         super();
         var _loc1_:KickImage = new KickImage();
         _loc1_.x = §_-L19§;
         _loc1_.y = §_-G17§;
         addChild(_loc1_);
         this.§_-vR§.start = 0;
         this.§_-vR§.radius = 39.65 * 0.5;
         this.§_-vR§.x = §_-L19§ + this.§_-vR§.radius;
         this.§_-vR§.y = §_-G17§ + this.§_-vR§.radius;
         this.§_-vR§.color = 16711680;
         this.§_-vR§.alpha = 0.5;
         this.§_-vR§.mouseEnabled = false;
         this.§_-vR§.mouseChildren = false;
         addChild(this.§_-vR§);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b1y§,§_-S2I§.§_-82J§,§_-S2I§.§_-F2m§,§_-S2I§.§_-R28§,§_-S2I§.§_-Vs§]);
      }
      
      public function update(param1:Number) : void
      {
         this.§_-vR§.end = Math.PI * 2 - param1 / 100 * Math.PI * 2;
      }
      
      public function reset() : void
      {
         this.§_-vR§.end = Math.PI * 2;
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function §_-u2U§() : void
      {
         this.reset();
         §_-01Y§.§_-l2K§(this.§_-C1U§);
         this.§_-Kq§ = 0;
         this.reportedPlayerId = 0;
         this.§_-f2W§ = new Vector.<int>();
      }
      
      private function §_-C1U§() : void
      {
         if(!§_-92z§.§_-O21§(this.reportedPlayerId))
         {
            return;
         }
         ++this.§_-Kq§;
         if(this.§_-Kq§ == §_-A1k§)
         {
            this.reset();
            §_-01Y§.§_-l2K§(this.§_-C1U§);
            §_-92z§.sendMessage(this.reportedPlayerId,"",§_-A1n§.§_-D16§);
            if(this.reportedPlayerId == Game.selfId)
            {
               Hero.self.§_-L1A§ = Hero.§_-y1c§;
               Hero.self.dead = true;
            }
            this.§_-u2U§();
         }
         this.update(this.§_-Kq§ / §_-A1k§ * 100);
      }
      
      private function §_-5I§(param1:int, param2:int) : void
      {
         if(!§_-92z§.§_-O21§(param1) || !§_-92z§.§_-O21§(param2))
         {
            return;
         }
         if(!Hero.self || !Hero.self.game)
         {
            return;
         }
         if(Hero.self.game.squirrels.§_-I2R§ > 2 || Hero.self.game.squirrels.§_-62q§ == 0 || this.§_-f2W§.indexOf(param2) != -1)
         {
            return;
         }
         this.§_-f2W§.push(param2);
         var _loc3_:Hero = Hero.self.game.squirrels.get(param2);
         var _loc4_:Hero = Hero.self.game.squirrels.get(param1);
         if(!_loc4_ || !_loc3_)
         {
            return;
         }
         if(_loc4_.shaman)
         {
            return;
         }
         if(!(_loc3_.shaman && !_loc3_.isDead) && this.§_-f2W§.length < §_-d1f§)
         {
            return;
         }
         _loc4_.addViewButton(this);
         this.reportedPlayerId = param1;
         §_-01Y§.§_-c9§(this.§_-C1U§);
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Object = null;
         switch(param1.type)
         {
            case §_-S2I§.§_-b1y§:
               _loc2_ = param1[1];
               if(!("reportedPlayerId" in _loc2_ && "targetPlayerId" in _loc2_))
               {
                  return;
               }
               §_-92z§.sendMessage(int(_loc2_["reportedPlayerId"]),"",§_-A1n§.§_-J2t§);
               this.§_-5I§(int(_loc2_["reportedPlayerId"]),int(_loc2_["targetPlayerId"]));
               break;
            case §_-S2I§.§_-82J§:
               if(param1[0].indexOf(this.reportedPlayerId) != -1)
               {
                  this.§_-u2U§();
               }
               break;
            case §_-S2I§.§_-F2m§:
               if(this.reportedPlayerId == param1[0])
               {
                  this.§_-u2U§();
               }
               break;
            case §_-S2I§.§_-R28§:
               if(this.reportedPlayerId == param1[0] || Game.selfId == param1[0])
               {
                  this.§_-u2U§();
               }
               break;
            case §_-S2I§.§_-Vs§:
               if(param1[0] == 1)
               {
                  return;
               }
               if(this.reportedPlayerId == param1[1])
               {
                  this.§_-u2U§();
               }
         }
      }
   }
}

