package §_-P2b§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-42B§.TweenMax;
   import flash.display.MovieClip;
   import protocol.§_-S2I§;
   import sounds.GameSounds;
   
   public class §_-sX§ extends §_-71e§
   {
      
      private var view:MovieClip = null;
      
      private var §_-e2J§:Hero = null;
      
      private var §_-41Z§:Object = {};
      
      public function §_-sX§(param1:Hero)
      {
         super(param1);
         this.§_-mw§ = true;
         this.view = new PerkSallyAnimation();
      }
      
      override public function get startCooldown() : Number
      {
         return 7;
      }
      
      override public function get totalCooldown() : Number
      {
         return 25;
      }
      
      override protected function get maxRadius() : Number
      {
         return 200;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.view = null;
      }
      
      override public function get json() : String
      {
         var _loc1_:Object = {};
         this.§_-e2J§ = this.hero.game.squirrels.get(this.§_-z2f§);
         _loc1_[this.hero.id] = {
            "pos":this.hero.position.Copy(),
            "vel":this.hero.velocity.Copy(),
            "angle":this.hero.angle
         };
         _loc1_[this.§_-e2J§.id] = {
            "pos":this.§_-e2J§.position.Copy(),
            "vel":this.§_-e2J§.velocity.Copy(),
            "angle":this.§_-e2J§.angle
         };
         return JSON.stringify(_loc1_);
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         if(!this.hero)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-S2I§.§_-w1R§:
               if(param1[2] == §_-S2I§.§_-L2G§)
               {
                  return;
               }
               if(param1[1] != this.§_-i2D§ || param1[0] != this.hero.id)
               {
                  return;
               }
               if(param1[2] == §_-S2I§.§_-EY§)
               {
                  this.§_-e2J§ = this.hero.game.squirrels.get(param1[4]);
                  if(!this.§_-e2J§)
                  {
                     return;
                  }
                  this.§_-41Z§ = param1[5];
                  GameSounds.play("leopard_roar");
                  this.view.addFrameScript(this.view.totalFrames - 1,this.§_-l1u§);
                  this.view.x = this.hero.heroView.direction ? -50 : 50;
                  this.view.scaleX = this.hero.heroView.direction ? -1 : 1;
                  this.view.y = this.hero.heroView.§_-yR§ - 50;
                  this.hero.heroView.addChild(this.view);
                  this.view.gotoAndPlay(0);
               }
               this.active = param1[2] == §_-S2I§.§_-EY§;
               break;
            default:
               super.§_-o2C§(param1);
         }
      }
      
      private function §_-l1u§() : void
      {
         if(!this.hero || !this.§_-e2J§)
         {
            return;
         }
         this.§_-a2J§(this.hero,this.§_-e2J§);
         this.view.stop();
         this.view.addFrameScript(this.view.totalFrames - 1,null);
         this.view.parent.removeChild(this.view);
      }
      
      private function §_-a2J§(param1:Hero, param2:Hero) : void
      {
         GameSounds.play("PerkTurqMonsterSwap");
         TweenMax.to(param1,1,{
            "x":this.§_-41Z§[param2.id]["pos"].x * Game.§_-x2P§,
            "y":this.§_-41Z§[param2.id]["pos"].y * Game.§_-x2P§,
            "rotation":this.§_-41Z§[param2.id]["angle"] * Game.R2D
         });
         TweenMax.to(param2,1,{
            "x":this.§_-41Z§[param1.id]["pos"].x * Game.§_-x2P§,
            "y":this.§_-41Z§[param1.id]["pos"].y * Game.§_-x2P§,
            "rotation":this.§_-41Z§[param1.id]["angle"] * Game.R2D,
            "onCompleteParams":[param1,param2],
            "onComplete":this.§_-V2f§
         });
      }
      
      private function §_-V2f§(param1:Hero, param2:Hero) : void
      {
         if(!param1 || !param2)
         {
            return;
         }
         param1.position = new b2Vec2(this.§_-41Z§[param2.id]["pos"].x,this.§_-41Z§[param2.id]["pos"].y);
         param1.velocity = new b2Vec2(this.§_-41Z§[param2.id]["vel"].x,this.§_-41Z§[param2.id]["vel"].y);
         param1.angle = this.§_-41Z§[param2.id]["angle"];
         param2.position = new b2Vec2(this.§_-41Z§[param1.id]["pos"].x,this.§_-41Z§[param1.id]["pos"].y);
         param2.velocity = new b2Vec2(this.§_-41Z§[param1.id]["vel"].x,this.§_-41Z§[param1.id]["vel"].y);
         param2.angle = this.§_-41Z§[param1.id]["angle"];
         this.active = false;
         this.§_-e2J§ = null;
      }
      
      override protected function §_-qu§(param1:Hero) : Boolean
      {
         return param1 && this.hero.id != param1.id && !param1.isDead && !param1.inHollow && !param1.shaman && !param1.isHare;
      }
   }
}

