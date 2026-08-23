package §_-vK§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-K2c§.TouchEvent;
   import §_-K2c§.§_-e2m§;
   import §_-K2c§.§_-sj§;
   import §_-RI§.§_-h2I§;
   import §_-S1D§.§_-O1M§;
   import §_-T2y§.§_-s1i§;
   import flash.geom.Point;
   import flash.ui.Mouse;
   import flash.utils.getDefinitionByName;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import starling.core.Starling;
   import utils.§_-X2Z§;
   
   public class §_-K17§ extends §_-21O§
   {
      
      protected var §_-4Z§:§_-h2I§ = null;
      
      protected var §_-k2C§:Point = new Point();
      
      protected var §_-Us§:Point = new Point();
      
      private var §_-r2R§:Array = [];
      
      private var §_-p1o§:int = 0;
      
      private var §_-T1h§:Boolean = false;
      
      private var §_-D1§:Boolean = false;
      
      public function §_-K17§(param1:Hero, param2:Array)
      {
         super(param1,param2);
      }
      
      override public function dispose() : void
      {
         this.§_-os§();
         super.dispose();
      }
      
      override public function reset() : void
      {
         super.reset();
         this.§_-A1W§();
         this.§_-D1§ = false;
      }
      
      override protected function activate() : void
      {
         var _loc1_:§_-qC§ = null;
         if(!this.hero || !this.hero.game)
         {
            this.active = false;
            return;
         }
         if(this.§_-p1o§ >= this.maxSelectionsCount)
         {
            this.§_-A1W§();
         }
         this.§_-D1§ = false;
         super.activate();
         if(!this.isSelf)
         {
            return;
         }
         for each(_loc1_ in this.hero.perkController.§_-515§)
         {
            if(_loc1_ != this && _loc1_ is §_-K17§ && _loc1_.active)
            {
               _loc1_.active = false;
            }
         }
         this.setSelection();
      }
      
      override protected function deactivate() : void
      {
         this.§_-os§();
         if(!this.§_-D1§)
         {
            this.§_-f1z§ = 0;
            §_-Py§();
            return;
         }
         super.deactivate();
         if(this.isSelf && this.§_-p1o§ > 0 && this.§_-p1o§ < this.maxSelectionsCount)
         {
            §_-Z1A§();
         }
      }
      
      override protected function get packets() : Array
      {
         return super.packets.concat([§_-S2I§.§_-b1y§]);
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         if(param1.type != §_-S2I§.§_-b1y§)
         {
            super.§_-o2C§(param1);
            return;
         }
         if(param1[0] != this.hero.id)
         {
            return;
         }
         var _loc2_:Object = param1[1];
         var _loc3_:Array = _loc2_["selectionFinished"];
         if(Boolean(_loc3_) && Boolean(_loc3_[0] == this.§_-i2D§) && _loc3_[1] == this.hero.id)
         {
            this.§_-Gd§(_loc3_[2]);
            return;
         }
         var _loc4_:Array = _loc2_["heroSelected"];
         if(!_loc4_ || _loc4_[0] != this.§_-i2D§ || _loc4_[1] != this.hero.id)
         {
            return;
         }
         this.selectedHero = _loc4_[2];
      }
      
      protected function setSelection() : void
      {
         if(!this.hero.isSelf || !this.hero.game)
         {
            return;
         }
         §_-O1M§.§_-SK§();
         Mouse.hide();
         §_-s1i§.instance.addEventListener(TouchEvent.§_-N1l§,this.§_-K1G§);
         if(this.§_-4Z§)
         {
            this.§_-4Z§.removeFromParent();
         }
         this.§_-4Z§ = new §_-h2I§(new HeroPointer());
         this.§_-4Z§.x = this.§_-Us§.x;
         this.§_-4Z§.y = this.§_-Us§.y;
         this.§_-4Z§.§_-x2x§();
         §_-s1i§.§_-831§.addChild(this.§_-4Z§.getStarlingView());
         this.§_-T1h§ = true;
      }
      
      protected function §_-os§() : void
      {
         if(!this.hero.isSelf)
         {
            return;
         }
         if(this.§_-4Z§)
         {
            this.§_-4Z§.removeFromParent();
         }
         this.§_-T1h§ = false;
         Mouse.show();
         §_-s1i§.instance.removeEventListener(TouchEvent.§_-N1l§,this.§_-K1G§);
      }
      
      protected function §_-D2T§() : void
      {
         this.§_-91N§();
      }
      
      protected function §_-91N§() : void
      {
         var _loc2_:Hero = null;
         var _loc4_:b2Vec2 = null;
         if(!this.hero.game)
         {
            this.active = false;
            return;
         }
         var _loc1_:Array = [];
         for each(_loc2_ in this.hero.game.squirrels.players)
         {
            if(this.§_-qu§(_loc2_))
            {
               _loc4_ = _loc2_.position.Copy();
               _loc4_.Subtract(new b2Vec2(this.§_-Us§.x / Game.§_-x2P§,this.§_-Us§.y / Game.§_-x2P§));
               if(Boolean(_loc2_.heroView.§_-iu§(this.§_-Us§)) || _loc4_.Length() < 6)
               {
                  _loc1_.push(_loc2_);
               }
            }
         }
         if(_loc1_.length == 0)
         {
            this.active = false;
            return;
         }
         var _loc3_:int = (§_-X2Z§.§_-C16§(_loc1_) as Hero).id;
         this.§_-r2R§.push(_loc3_);
         ++this.§_-p1o§;
         this.§_-D1§ = true;
         this.§_-D2j§({"heroSelected":[this.§_-i2D§,this.hero.id,_loc3_]});
         if(this.§_-p1o§ >= this.maxSelectionsCount && !this.multipleSelection)
         {
            this.§_-B1V§();
         }
      }
      
      protected function §_-B1V§() : void
      {
         this.§_-D2j§({"selectionFinished":[this.§_-i2D§,this.hero.id,this.§_-p1o§]});
         this.§_-Gd§(this.§_-p1o§);
      }
      
      protected function get multipleSelection() : Boolean
      {
         return false;
      }
      
      protected function set selectedHero(param1:int) : void
      {
         if(!this.hero.game)
         {
            return;
         }
         var _loc2_:Hero = this.hero.game.squirrels.get(param1);
         if(!_loc2_)
         {
            return;
         }
         _loc2_.heroView.§_-S2O§();
         _loc2_.heroView.§_-A2O§(new §_-QC§.perkData[this.§_-i2D§]["buttonClass"](),1);
      }
      
      protected function §_-qu§(param1:Hero) : Boolean
      {
         if(!Game.toggle)
         {
            while(true)
            {
               if(!(this is §_-g2j§))
               {
                  if(!(this is §_-Fl§))
                  {
                     break;
                  }
               }
               if(param1.id == this.hero.id)
               {
                  return true;
               }
               break;
            }
         }
         if(!Game.toggle)
         {
            if(this is §_-b21§)
            {
               if(param1.id == this.hero.id)
               {
                  return true;
               }
            }
            return param1 && param1.§_-k2W§ && param1.id != this.hero.id && !param1.isHare && !param1.shaman && !param1.isDead && !param1.inHollow && this.§_-r2R§.indexOf(param1.id) == -1;
         }
         return param1 && param1.§_-k2W§ && param1.id != this.hero.id && !param1.isHare && !param1.shaman && !param1.isDead && !param1.inHollow && this.§_-r2R§.indexOf(param1.id) == -1;
      }
      
      protected function get maxSelectionsCount() : int
      {
         return 1;
      }
      
      private function §_-Gd§(param1:int) : void
      {
         this.§_-A1W§();
         this.active = false;
         if(!this.isSelf || this.§_-g1M§ || param1 < 1)
         {
            return;
         }
         this.§_-3V§ = this.totalCooldown;
         §_-Py§();
      }
      
      private function §_-A1W§() : void
      {
         this.§_-r2R§ = [];
         this.§_-p1o§ = 0;
      }
      
      private function §_-D2j§(param1:Object) : void
      {
         Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify(param1));
      }
      
      private function §_-K1G§(param1:TouchEvent) : void
      {
         var _loc2_:§_-e2m§ = param1.§_-H2o§(Starling.§_-y1l§.stage);
         if(!_loc2_)
         {
            return;
         }
         this.§_-k2C§.setTo(_loc2_.§_-n2h§,_loc2_.§_-Zv§);
         this.§_-Us§ = _loc2_.§_-l29§(§_-s1i§.instance);
         if(this.§_-4Z§)
         {
            this.§_-4Z§.x = this.§_-Us§.x;
            this.§_-4Z§.y = this.§_-Us§.y;
         }
         var _loc3_:Boolean = Boolean(this.hero.game) && this.hero.game.§_-W2H§();
         if(this.§_-4Z§)
         {
            this.§_-4Z§.visible = _loc3_;
         }
         if(_loc3_)
         {
            Mouse.hide();
         }
         else
         {
            Mouse.show();
         }
         if(_loc2_.§_-Q2S§ == §_-sj§.§_-L23§ && this.§_-T1h§ && _loc3_)
         {
            this.§_-D2T§();
         }
      }
   }
}

