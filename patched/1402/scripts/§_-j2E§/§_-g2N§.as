package §_-j2E§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-Cc§.§_-l2t§;
   import flash.display.MovieClip;
   import flash.geom.Point;
   import game.mainGame.SquirrelGame;
   import protocol.§_-s2l§;
   
   public class §_-g2N§ extends §_-92f§
   {
      
      private static const §_-A2L§:Number = 25;
      
      private static var §_-93m§:MovieClip = null;
      
      private static var §_-y1h§:MovieClip = null;
      
      public function §_-g2N§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = "PerkCaesar";
      }
      
      override public function get json() : String
      {
         var _loc2_:Hero = null;
         var _loc3_:b2Vec2 = null;
         if(this.active)
         {
            return "";
         }
         var _loc1_:Array = [];
         for each(_loc2_ in this.hero.game.squirrels.players)
         {
            if(!(_loc2_.isSelf || _loc2_.isDead || _loc2_.inHollow || _loc2_.shaman))
            {
               _loc3_ = this.hero.position.Copy();
               _loc3_.Subtract(_loc2_.position);
               if(_loc3_.Length() <= §_-A2L§)
               {
                  _loc1_.push(_loc2_.id);
               }
            }
         }
         return JSON.stringify(_loc1_);
      }
      
      override public function get totalCooldown() : Number
      {
         return 30;
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         switch(param1.type)
         {
            case §_-s2l§.§_-C1i§:
               if(param1[2] == §_-s2l§.§_-j2o§)
               {
                  return;
               }
               if(param1[1] != this.§_-T2a§ || param1[0] != this.hero.id)
               {
                  return;
               }
               this.active = param1[2] == §_-s2l§.§_-x2Y§;
               if(param1[2] == §_-s2l§.§_-x2Y§)
               {
                  _loc2_ = param1[5];
                  _loc3_ = 0;
                  while(_loc3_ < _loc2_.length)
                  {
                     this.hero.game.squirrels.get(_loc2_[_loc3_]).behaviourController.§_-W10§(new §_-l2t§(10));
                     _loc3_++;
                  }
                  this.§_-U2J§();
               }
               break;
            default:
               super.§_-x2f§(param1);
         }
      }
      
      private function §_-U2J§() : void
      {
         if(§_-93m§ == null)
         {
            §_-93m§ = new CaesarPerkView();
            §_-93m§.addFrameScript(§_-93m§.totalFrames - 1,this.§_-R2W§);
         }
         §_-93m§.mouseEnabled = false;
         §_-93m§.mouseChildren = false;
         §_-93m§.width = Game.starling.stage.stageWidth;
         §_-93m§.height = Game.starling.stage.stageHeight;
         §_-93m§.gotoAndPlay(0);
         if(!SquirrelGame.instance.contains(§_-93m§))
         {
            SquirrelGame.instance.addChild(§_-93m§);
         }
         var _loc1_:Point = this.hero.getPosition();
         if(§_-y1h§ == null)
         {
            §_-y1h§ = new CaesarPerkLightning();
            §_-y1h§.addFrameScript(§_-y1h§.totalFrames - 1,this.§_-S1X§);
         }
         §_-y1h§.x = _loc1_.x;
         §_-y1h§.y = _loc1_.y;
         §_-y1h§.rotation = this.hero.rotation;
         §_-y1h§.gotoAndPlay(0);
         if(!this.hero.game.map.§_-o1i§.contains(§_-y1h§))
         {
            this.hero.game.map.§_-o1i§.addChild(§_-y1h§);
         }
      }
      
      private function §_-R2W§() : void
      {
         §_-93m§.stop();
         if(§_-93m§ != null && Boolean(§_-93m§.parent))
         {
            §_-93m§.parent.removeChild(§_-93m§);
         }
      }
      
      private function §_-S1X§() : void
      {
         §_-y1h§.stop();
         if(§_-y1h§ != null && Boolean(§_-y1h§.parent))
         {
            §_-y1h§.parent.removeChild(§_-y1h§);
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
         §_-93m§ = null;
         §_-y1h§ = null;
      }
   }
}

