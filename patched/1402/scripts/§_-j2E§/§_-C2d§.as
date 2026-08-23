package §_-j2E§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-22D§.TweenMax;
   import flash.display.MovieClip;
   import protocol.§_-s2l§;
   import sounds.GameSounds;
   
   public class §_-C2d§ extends §_-l2A§
   {
      
      private var view:MovieClip = null;
      
      private var §_-c1T§:Hero = null;
      
      private var §_-sB§:Object = {};
      
      public function §_-C2d§(param1:Hero)
      {
         super(param1);
         this.§_-i1J§ = true;
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
         this.§_-c1T§ = this.hero.game.squirrels.get(this.§_-w2w§);
         _loc1_[this.hero.id] = {
            "pos":this.hero.position.Copy(),
            "vel":this.hero.velocity.Copy(),
            "angle":this.hero.angle
         };
         _loc1_[this.§_-c1T§.id] = {
            "pos":this.§_-c1T§.position.Copy(),
            "vel":this.§_-c1T§.velocity.Copy(),
            "angle":this.§_-c1T§.angle
         };
         return JSON.stringify(_loc1_);
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         if(!this.hero)
         {
            return;
         }
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
               if(param1[2] == §_-s2l§.§_-x2Y§)
               {
                  this.§_-c1T§ = this.hero.game.squirrels.get(param1[4]);
                  if(!this.§_-c1T§)
                  {
                     return;
                  }
                  this.§_-sB§ = param1[5];
                  GameSounds.play("leopard_roar");
                  this.view.addFrameScript(this.view.totalFrames - 1,this.§_-c1P§);
                  this.view.x = this.hero.heroView.direction ? -50 : 50;
                  this.view.scaleX = this.hero.heroView.direction ? -1 : 1;
                  this.view.y = this.hero.heroView.§_-FH§ - 50;
                  this.hero.heroView.addChild(this.view);
                  this.view.gotoAndPlay(0);
               }
               this.active = param1[2] == §_-s2l§.§_-x2Y§;
               break;
            default:
               super.§_-x2f§(param1);
         }
      }
      
      private function §_-c1P§() : void
      {
         if(!this.hero || !this.§_-c1T§)
         {
            return;
         }
         this.§_-mX§(this.hero,this.§_-c1T§);
         this.view.stop();
         this.view.addFrameScript(this.view.totalFrames - 1,null);
         this.view.parent.removeChild(this.view);
      }
      
      private function §_-mX§(param1:Hero, param2:Hero) : void
      {
         GameSounds.play("PerkTurqMonsterSwap");
         TweenMax.to(param1,1,{
            "x":this.§_-sB§[param2.id]["pos"].x * Game.§_-12A§,
            "y":this.§_-sB§[param2.id]["pos"].y * Game.§_-12A§,
            "rotation":this.§_-sB§[param2.id]["angle"] * Game.R2D
         });
         TweenMax.to(param2,1,{
            "x":this.§_-sB§[param1.id]["pos"].x * Game.§_-12A§,
            "y":this.§_-sB§[param1.id]["pos"].y * Game.§_-12A§,
            "rotation":this.§_-sB§[param1.id]["angle"] * Game.R2D,
            "onCompleteParams":[param1,param2],
            "onComplete":this.§_-A2U§
         });
      }
      
      private function §_-A2U§(param1:Hero, param2:Hero) : void
      {
         if(!param1 || !param2)
         {
            return;
         }
         param1.position = new b2Vec2(this.§_-sB§[param2.id]["pos"].x,this.§_-sB§[param2.id]["pos"].y);
         param1.velocity = new b2Vec2(this.§_-sB§[param2.id]["vel"].x,this.§_-sB§[param2.id]["vel"].y);
         param1.angle = this.§_-sB§[param2.id]["angle"];
         param2.position = new b2Vec2(this.§_-sB§[param1.id]["pos"].x,this.§_-sB§[param1.id]["pos"].y);
         param2.velocity = new b2Vec2(this.§_-sB§[param1.id]["vel"].x,this.§_-sB§[param1.id]["vel"].y);
         param2.angle = this.§_-sB§[param1.id]["angle"];
         this.active = false;
         this.§_-c1T§ = null;
      }
      
      override protected function §_-3M§(param1:Hero) : Boolean
      {
         return param1 && this.hero.id != param1.id && !param1.isDead && !param1.inHollow && !param1.shaman && !param1.isHare;
      }
   }
}

