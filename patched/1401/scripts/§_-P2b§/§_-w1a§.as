package §_-P2b§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-42B§.TweenMax;
   import flash.display.MovieClip;
   import flash.events.Event;
   import protocol.§_-S2I§;
   
   public class §_-w1a§ extends §_-H2N§
   {
      
      private static const §_-y23§:Number = 3;
      
      private static const §_-GS§:Number = 0.5;
      
      private var §_-R1j§:Number = 0;
      
      private var §_-w2W§:Array = [];
      
      private var §_-I1y§:int = 0;
      
      private var §_-ZI§:Object = {};
      
      private var view:MovieClip = null;
      
      public function §_-w1a§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = "chronos";
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.§_-R1j§ <= 0)
         {
            this.§_-kk§();
            this.§_-R1j§ = §_-GS§;
         }
         else
         {
            this.§_-R1j§ -= param1;
         }
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get canTurnOff() : Boolean
      {
         return false;
      }
      
      override public function get startCooldown() : Number
      {
         return 20;
      }
      
      override public function get totalCooldown() : Number
      {
         return 20;
      }
      
      override public function get json() : String
      {
         var _loc1_:Object = null;
         if(this.active)
         {
            return "";
         }
         if(this.§_-w2W§.length == 0)
         {
            return "";
         }
         if(this.§_-w2W§.length < int(§_-y23§ / §_-GS§))
         {
            _loc1_ = this.§_-w2W§[0];
         }
         else
         {
            _loc1_ = this.§_-w2W§[this.§_-w2W§.length - int(§_-y23§ / §_-GS§)];
         }
         return JSON.stringify(_loc1_);
      }
      
      override public function get available() : Boolean
      {
         return super.available && !this.hero.heroView.§_-k2P§;
      }
      
      override public function dispose() : void
      {
         if(this.view)
         {
            this.view.removeEventListener(Event.CHANGE,onComplete);
         }
         this.hero.game.paused = false;
         super.dispose();
      }
      
      override public function §_-S2A§() : void
      {
         this.§_-w2W§.splice(0);
         super.§_-S2A§();
      }
      
      override protected function activate() : void
      {
         if(!this.hero.game || this.hero.game.paused || this.hero.isDead || this.hero.inHollow)
         {
            this.active = false;
            return;
         }
         super.activate();
         this.view = new ChronosPerkView();
         this.view.addEventListener(Event.CHANGE,this.§_-b2I§);
         this.view.y = -60;
         this.hero.heroView.addChild(this.view);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         this.hero.game.paused = false;
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         if(this.hero == null)
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
               this.active = param1[2] == §_-S2I§.§_-EY§;
               if(param1[2] != §_-S2I§.§_-EY§)
               {
                  return;
               }
               this.§_-ZI§ = {};
               this.§_-I1y§ = 0;
               this.§_-72x§(param1[5]);
               break;
            default:
               super.§_-o2C§(param1);
         }
      }
      
      protected function §_-b2I§(param1:Event) : void
      {
         this.view.removeEventListener(Event.CHANGE,this.§_-b2I§);
         if(Boolean(this.view) && Boolean(this.view.parent))
         {
            this.view.parent.removeChild(this.view);
         }
      }
      
      private function §_-kk§() : void
      {
         var _loc2_:Hero = null;
         if(Boolean(this.hero.game) && this.hero.game.paused)
         {
            return;
         }
         var _loc1_:Object = {};
         for each(_loc2_ in this.hero.game.squirrels.players)
         {
            if(!_loc2_.isSelf && _loc2_.isSquirrel)
            {
               _loc1_[_loc2_.id] = {
                  "pos":_loc2_.position.Copy(),
                  "vel":_loc2_.velocity.Copy(),
                  "angle":_loc2_.angle
               };
            }
         }
         this.§_-w2W§.push(_loc1_);
      }
      
      private function §_-72x§(param1:Object) : void
      {
         var _loc2_:Hero = null;
         this.hero.game.paused = true;
         for each(_loc2_ in this.hero.game.squirrels.players)
         {
            if(!(!this.§_-qu§(_loc2_) || !(_loc2_.id in param1)))
            {
               ++this.§_-I1y§;
               this.§_-ZI§[_loc2_.id] = {
                  "pos":new b2Vec2(param1[_loc2_.id]["pos"].x,param1[_loc2_.id]["pos"].y),
                  "vel":new b2Vec2(param1[_loc2_.id]["vel"].x,param1[_loc2_.id]["vel"].y),
                  "angle":param1[_loc2_.id]["angle"]
               };
               TweenMax.to(_loc2_,1,{
                  "x":param1[_loc2_.id]["pos"].x * Game.§_-x2P§,
                  "y":param1[_loc2_.id]["pos"].y * Game.§_-x2P§,
                  "rotation":param1[_loc2_.id]["angle"] * Game.R2D,
                  "onComplete":this.§_-V2f§
               });
            }
         }
         if(this.§_-I1y§ == 0)
         {
            this.active = false;
         }
      }
      
      private function §_-V2f§() : void
      {
         var _loc1_:String = null;
         var _loc2_:Hero = null;
         if(--this.§_-I1y§ != 0)
         {
            return;
         }
         if(Boolean(this.hero) && Boolean(this.hero.game) && Boolean(this.hero.game.squirrels.players))
         {
            for(_loc1_ in this.§_-ZI§)
            {
               _loc2_ = this.hero.game.squirrels.get(int(_loc1_));
               if(this.§_-qu§(_loc2_))
               {
                  _loc2_.position = this.§_-ZI§[_loc1_]["pos"];
                  _loc2_.velocity = this.§_-ZI§[_loc1_]["vel"];
                  _loc2_.angle = this.§_-ZI§[_loc1_]["angle"];
               }
            }
         }
         this.active = false;
      }
      
      private function §_-qu§(param1:Hero) : Boolean
      {
         return param1 && param1.§_-k2W§ && !param1.shaman && !param1.isDead && !param1.inHollow && !param1.hover;
      }
   }
}

