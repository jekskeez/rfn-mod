package §_-vK§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-42B§.TweenMax;
   import §_-8I§.SquirrelEvent;
   import §_-S1D§.§_-O1M§;
   import flash.display.MovieClip;
   import flash.events.Event;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-g2U§ extends §_-21O§
   {
      
      private static const §_-c1F§:Number = 10;
      
      private static const §_-713§:Number = 1;
      
      private var §_-Mz§:Number = 0;
      
      private var §_-w2W§:Array = [];
      
      private var §_-I1y§:int = 0;
      
      private var §_-ZI§:Object = {};
      
      private var view:MovieClip = null;
      
      public function §_-g2U§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-F1S§;
      }
      
      override public function dispose() : void
      {
         if(this.hero)
         {
            this.hero.removeEventListener(SquirrelEvent.§_-S2i§,this.§_-mN§);
            this.hero.removeEventListener(SquirrelEvent.§_-n1x§,this.§_-mN§);
            this.hero.removeEventListener(SquirrelEvent.§_-z1B§,this.§_-mN§);
         }
         if(this.view)
         {
            this.view.removeEventListener(Event.CHANGE,this.§_-B2P§);
         }
         super.dispose();
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(!this.hero.isSelf)
         {
            return;
         }
         if(§_-O1M§.§_-F2g§ != §_-S2I§.ROUND_START)
         {
            return;
         }
         this.§_-Y1H§(param1);
      }
      
      override public function reset() : void
      {
         this.§_-w2W§.splice(0);
         super.reset();
      }
      
      override protected function activate() : void
      {
         if(!this.hero.game || this.hero.game.paused || this.hero.isDead || this.hero.inHollow)
         {
            this.active = false;
            return;
         }
         super.activate();
         this.hero.game.paused = true;
         this.hero.addEventListener(SquirrelEvent.§_-S2i§,this.§_-mN§);
         this.hero.addEventListener(SquirrelEvent.§_-n1x§,this.§_-mN§);
         this.hero.addEventListener(SquirrelEvent.§_-z1B§,this.§_-mN§);
         this.view = new ChronosPerkView();
         this.view.addEventListener(Event.CHANGE,this.§_-B2P§);
         this.view.y = -Hero.§_-YH§;
         this.hero.heroView.addChild(this.view);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         this.§_-w2W§.splice(0);
         if(this.hero)
         {
            this.hero.removeEventListener(SquirrelEvent.§_-S2i§,this.§_-mN§);
            this.hero.removeEventListener(SquirrelEvent.§_-n1x§,this.§_-mN§);
            this.hero.removeEventListener(SquirrelEvent.§_-z1B§,this.§_-mN§);
            if(this.hero.game)
            {
               this.hero.game.paused = false;
            }
         }
         if(!this.view)
         {
            return;
         }
         this.view.removeEventListener(Event.CHANGE,this.§_-B2P§);
         if(this.view.parent)
         {
            this.view.parent.removeChild(this.view);
         }
      }
      
      override protected function get packets() : Array
      {
         return super.packets.concat([§_-S2I§.§_-b1y§,§_-S2I§.§_-Vs§]);
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Object = null;
         if(this.hero == null)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-S2I§.§_-Vs§:
               if(param1[1] != this.hero.id)
               {
                  return;
               }
               this.active = false;
               return;
               break;
            case §_-S2I§.§_-b1y§:
               _loc2_ = param1[1];
               if(!("timeMaster" in _loc2_))
               {
                  return;
               }
               if(!this.hero || _loc2_["timeMaster"][0] != this.hero.id)
               {
                  return;
               }
               if(!this.active)
               {
                  return;
               }
               this.§_-ZI§ = {};
               this.§_-I1y§ = 0;
               this.§_-72x§(_loc2_["timeMaster"][1]);
               break;
            default:
               super.§_-o2C§(param1);
         }
      }
      
      private function §_-B2P§(param1:Event) : void
      {
         this.view.removeEventListener(Event.COMPLETE,this.§_-B2P§);
         if(this.view.parent)
         {
            this.view.parent.removeChild(this.view);
         }
         this.§_-B1t§();
      }
      
      private function §_-Y1H§(param1:Number) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Hero = null;
         if(Boolean(this.hero.game) && this.hero.game.paused)
         {
            return;
         }
         this.§_-Mz§ += param1;
         if(this.§_-Mz§ >= §_-713§)
         {
            this.§_-Mz§ -= §_-713§;
            if(this.§_-w2W§.length == §_-Nu§())
            {
               this.§_-w2W§.shift();
            }
            _loc2_ = {};
            for each(_loc3_ in this.hero.game.squirrels.players)
            {
               if(Boolean(_loc3_) && !_loc3_.isDead)
               {
                  _loc2_[_loc3_.id] = {
                     "pos":_loc3_.position.Copy(),
                     "vel":_loc3_.velocity.Copy(),
                     "angle":_loc3_.angle
                  };
               }
            }
            this.§_-w2W§.push(_loc2_);
         }
      }
      
      private function §_-mN§(param1:SquirrelEvent) : void
      {
         this.active = false;
      }
      
      private function §_-B1t§() : void
      {
         if(this.§_-w2W§.length == 0)
         {
            this.deactivate();
         }
         if(this.hero.isSelf && this.§_-w2W§.length == 0 || !this.hero || !this.hero.game)
         {
            this.active = false;
            return;
         }
         if(!this.hero.isSelf)
         {
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"timeMaster":[this.hero.id,this.§_-w2W§.shift()]}));
      }
      
      private function §_-72x§(param1:Object) : void
      {
         var _loc2_:Hero = null;
         for each(_loc2_ in this.hero.game.squirrels.players)
         {
            if(!(!this.§_-qu§(_loc2_) || !(_loc2_.id in param1)))
            {
               if(!(!this.§_-41W§ && _loc2_.id != this.hero.id))
               {
                  if(!(this.§_-41W§ && !this.§_-w1q§(_loc2_)))
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
         return param1 && param1.§_-k2W§ && !param1.isDead && !param1.inHollow && !param1.hover;
      }
      
      private function §_-w1q§(param1:Hero) : Boolean
      {
         var _loc2_:b2Vec2 = this.hero.position.Copy();
         _loc2_.Subtract(param1.position);
         return _loc2_.Length() <= §_-c1F§;
      }
      
      override public function get canTurnOff() : Boolean
      {
         return false;
      }
      
      override public function get totalCooldown() : Number
      {
         return 60;
      }
   }
}

