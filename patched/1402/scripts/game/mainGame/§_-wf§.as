package game.mainGame
{
   import §_-c2C§.§_-u24§;
   import chat.§_-g1j§;
   import flash.display.Sprite;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import utils.§_-45§;
   
   public class §_-wf§ extends Sprite
   {
      
      private static const §_-R2m§:int = 10;
      
      private static const §_-m2q§:int = 5;
      
      public static const §_-31R§:int = -20;
      
      public static const §_-t2§:int = -120;
      
      private var §_-Vi§:§_-45§ = new §_-45§();
      
      public var §_-el§:int = 0;
      
      public var reportedPlayerId:int = 0;
      
      public var §_-f1U§:Vector.<int> = new Vector.<int>();
      
      public function §_-wf§()
      {
         super();
         var _loc1_:KickImage = new KickImage();
         _loc1_.x = §_-31R§;
         _loc1_.y = §_-t2§;
         addChild(_loc1_);
         this.§_-Vi§.start = 0;
         this.§_-Vi§.radius = 39.65 * 0.5;
         this.§_-Vi§.x = §_-31R§ + this.§_-Vi§.radius;
         this.§_-Vi§.y = §_-t2§ + this.§_-Vi§.radius;
         this.§_-Vi§.color = 16711680;
         this.§_-Vi§.alpha = 0.5;
         this.§_-Vi§.mouseEnabled = false;
         this.§_-Vi§.mouseChildren = false;
         addChild(this.§_-Vi§);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-1q§,§_-s2l§.§_-Yi§,§_-s2l§.§_-v1r§,§_-s2l§.§_-V1b§,§_-s2l§.§_-n1f§]);
      }
      
      public function update(param1:Number) : void
      {
         this.§_-Vi§.end = Math.PI * 2 - param1 / 100 * Math.PI * 2;
      }
      
      public function reset() : void
      {
         this.§_-Vi§.end = Math.PI * 2;
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function §_-22r§() : void
      {
         this.reset();
         §_-p1V§.§_-B3x§(this.§_-R1Y§);
         this.§_-el§ = 0;
         this.reportedPlayerId = 0;
         this.§_-f1U§ = new Vector.<int>();
      }
      
      private function §_-R1Y§() : void
      {
         if(!§_-u24§.§_-bL§(this.reportedPlayerId))
         {
            return;
         }
         ++this.§_-el§;
         if(this.§_-el§ == §_-R2m§)
         {
            this.reset();
            §_-p1V§.§_-B3x§(this.§_-R1Y§);
            §_-u24§.sendMessage(this.reportedPlayerId,"",§_-g1j§.§_-U2z§);
            if(this.reportedPlayerId == Game.selfId)
            {
               Hero.self.§_-b2d§ = Hero.§_-kU§;
               Hero.self.dead = true;
            }
            this.§_-22r§();
         }
         this.update(this.§_-el§ / §_-R2m§ * 100);
      }
      
      private function §_-734§(param1:int, param2:int) : void
      {
         if(!§_-u24§.§_-bL§(param1) || !§_-u24§.§_-bL§(param2))
         {
            return;
         }
         if(!Hero.self || !Hero.self.game)
         {
            return;
         }
         if(Hero.self.game.squirrels.§_-q2q§ > 2 || Hero.self.game.squirrels.§_-mt§ == 0 || this.§_-f1U§.indexOf(param2) != -1)
         {
            return;
         }
         this.§_-f1U§.push(param2);
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
         if(!(_loc3_.shaman && !_loc3_.isDead) && this.§_-f1U§.length < §_-m2q§)
         {
            return;
         }
         _loc4_.addViewButton(this);
         this.reportedPlayerId = param1;
         §_-p1V§.§_-63T§(this.§_-R1Y§);
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Object = null;
         switch(param1.type)
         {
            case §_-s2l§.§_-1q§:
               _loc2_ = param1[1];
               if(!("reportedPlayerId" in _loc2_ && "targetPlayerId" in _loc2_))
               {
                  return;
               }
               §_-u24§.sendMessage(int(_loc2_["reportedPlayerId"]),"",§_-g1j§.§_-035§);
               this.§_-734§(int(_loc2_["reportedPlayerId"]),int(_loc2_["targetPlayerId"]));
               break;
            case §_-s2l§.§_-Yi§:
               if(param1[0].indexOf(this.reportedPlayerId) != -1)
               {
                  this.§_-22r§();
               }
               break;
            case §_-s2l§.§_-v1r§:
               if(this.reportedPlayerId == param1[0])
               {
                  this.§_-22r§();
               }
               break;
            case §_-s2l§.§_-V1b§:
               if(this.reportedPlayerId == param1[0] || Game.selfId == param1[0])
               {
                  this.§_-22r§();
               }
               break;
            case §_-s2l§.§_-n1f§:
               if(param1[0] == 1)
               {
                  return;
               }
               if(this.reportedPlayerId == param1[1])
               {
                  this.§_-22r§();
               }
         }
      }
   }
}

