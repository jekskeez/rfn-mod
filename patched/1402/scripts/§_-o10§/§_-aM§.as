package §_-o10§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-61C§.§_-a2p§;
   import §_-TK§.§_-aS§;
   import §_-c2C§.§_-817§;
   import §_-f1T§.TouchEvent;
   import §_-f1T§.§_-01Z§;
   import §_-f1T§.§_-J1a§;
   import flash.geom.Point;
   import flash.ui.Mouse;
   import flash.utils.getDefinitionByName;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import starling.core.Starling;
   import utils.§_-H1o§;
   
   public class §_-aM§ extends §_-S2w§
   {
      
      protected var §_-F1f§:§_-aS§ = null;
      
      protected var §_-z2x§:Point = new Point();
      
      protected var §_-5b§:Point = new Point();
      
      private var §_-w1h§:Array = [];
      
      private var §_-63v§:int = 0;
      
      private var §_-72x§:Boolean = false;
      
      private var §_-GJ§:Boolean = false;
      
      public function §_-aM§(param1:Hero, param2:Array)
      {
         super(param1,param2);
      }
      
      override public function dispose() : void
      {
         this.§_-c2j§();
         super.dispose();
      }
      
      override public function reset() : void
      {
         super.reset();
         this.§_-02F§();
         this.§_-GJ§ = false;
      }
      
      override protected function activate() : void
      {
         var _loc1_:§_-p1B§ = null;
         if(!this.hero || !this.hero.game)
         {
            this.active = false;
            return;
         }
         if(this.§_-63v§ >= this.maxSelectionsCount)
         {
            this.§_-02F§();
         }
         this.§_-GJ§ = false;
         super.activate();
         if(!this.isSelf)
         {
            return;
         }
         for each(_loc1_ in this.hero.perkController.§_-ov§)
         {
            if(_loc1_ != this && _loc1_ is §_-aM§ && _loc1_.active)
            {
               _loc1_.active = false;
            }
         }
         this.setSelection();
      }
      
      override protected function deactivate() : void
      {
         this.§_-c2j§();
         if(!this.§_-GJ§)
         {
            this.§_-h1§ = 0;
            §_-O25§();
            return;
         }
         super.deactivate();
         if(this.isSelf && this.§_-63v§ > 0 && this.§_-63v§ < this.maxSelectionsCount)
         {
            §_-k1J§();
         }
      }
      
      override protected function get packets() : Array
      {
         return super.packets.concat([§_-s2l§.§_-1q§]);
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         if(param1.type != §_-s2l§.§_-1q§)
         {
            super.§_-x2f§(param1);
            return;
         }
         if(param1[0] != this.hero.id)
         {
            return;
         }
         var _loc2_:Object = param1[1];
         var _loc3_:Array = _loc2_["selectionFinished"];
         if(Boolean(_loc3_) && Boolean(_loc3_[0] == this.§_-T2a§) && _loc3_[1] == this.hero.id)
         {
            this.§_-I1P§(_loc3_[2]);
            return;
         }
         var _loc4_:Array = _loc2_["heroSelected"];
         if(!_loc4_ || _loc4_[0] != this.§_-T2a§ || _loc4_[1] != this.hero.id)
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
         §_-a2p§.§_-Y1F§();
         Mouse.hide();
         §_-817§.instance.addEventListener(TouchEvent.§_-qu§,this.§_-w1m§);
         if(this.§_-F1f§)
         {
            this.§_-F1f§.removeFromParent();
         }
         this.§_-F1f§ = new §_-aS§(new HeroPointer());
         this.§_-F1f§.x = this.§_-5b§.x;
         this.§_-F1f§.y = this.§_-5b§.y;
         this.§_-F1f§.§_-i18§();
         §_-817§.§_-X2a§.addChild(this.§_-F1f§.getStarlingView());
         this.§_-72x§ = true;
      }
      
      protected function §_-c2j§() : void
      {
         if(!this.hero.isSelf)
         {
            return;
         }
         if(this.§_-F1f§)
         {
            this.§_-F1f§.removeFromParent();
         }
         this.§_-72x§ = false;
         Mouse.show();
         §_-817§.instance.removeEventListener(TouchEvent.§_-qu§,this.§_-w1m§);
      }
      
      protected function §_-w2U§() : void
      {
         this.§_-h1u§();
      }
      
      protected function §_-h1u§() : void
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
            if(this.§_-3M§(_loc2_))
            {
               _loc4_ = _loc2_.position.Copy();
               _loc4_.Subtract(new b2Vec2(this.§_-5b§.x / Game.§_-12A§,this.§_-5b§.y / Game.§_-12A§));
               if(Boolean(_loc2_.heroView.§_-31u§(this.§_-5b§)) || _loc4_.Length() < 6)
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
         var _loc3_:int = (§_-H1o§.§_-XF§(_loc1_) as Hero).id;
         this.§_-w1h§.push(_loc3_);
         ++this.§_-63v§;
         this.§_-GJ§ = true;
         this.§_-QD§({"heroSelected":[this.§_-T2a§,this.hero.id,_loc3_]});
         if(this.§_-63v§ >= this.maxSelectionsCount && !this.multipleSelection)
         {
            this.§_-B2F§();
         }
      }
      
      protected function §_-B2F§() : void
      {
         this.§_-QD§({"selectionFinished":[this.§_-T2a§,this.hero.id,this.§_-63v§]});
         this.§_-I1P§(this.§_-63v§);
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
         _loc2_.heroView.§_-k1I§();
         _loc2_.heroView.§_-v2L§(new §_-pl§.perkData[this.§_-T2a§]["buttonClass"](),1);
      }
      
      protected function §_-3M§(param1:Hero) : Boolean
      {
         if(!Game.toggle)
         {
            while(true)
            {
               if(!(this is §_-13b§))
               {
                  if(!(this is §_-jc§))
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
            if(this is §_-s2S§)
            {
               if(param1.id == this.hero.id)
               {
                  return true;
               }
            }
            return param1 && param1.§_-K13§ && param1.id != this.hero.id && !param1.isHare && !param1.shaman && !param1.isDead && !param1.inHollow && this.§_-w1h§.indexOf(param1.id) == -1;
         }
         return param1 && param1.§_-K13§ && param1.id != this.hero.id && !param1.isHare && !param1.shaman && !param1.isDead && !param1.inHollow && this.§_-w1h§.indexOf(param1.id) == -1;
      }
      
      protected function get maxSelectionsCount() : int
      {
         return 1;
      }
      
      private function §_-I1P§(param1:int) : void
      {
         this.§_-02F§();
         this.active = false;
         if(!this.isSelf || this.§_-x2b§ || param1 < 1)
         {
            return;
         }
         this.§_-G27§ = this.totalCooldown;
         §_-O25§();
      }
      
      private function §_-02F§() : void
      {
         this.§_-w1h§ = [];
         this.§_-63v§ = 0;
      }
      
      private function §_-QD§(param1:Object) : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify(param1));
      }
      
      private function §_-w1m§(param1:TouchEvent) : void
      {
         var _loc2_:§_-J1a§ = param1.§_-d2S§(Starling.§_-n1s§.stage);
         if(!_loc2_)
         {
            return;
         }
         this.§_-z2x§.setTo(_loc2_.§_-ca§,_loc2_.§_-n2z§);
         this.§_-5b§ = _loc2_.§_-13l§(§_-817§.instance);
         if(this.§_-F1f§)
         {
            this.§_-F1f§.x = this.§_-5b§.x;
            this.§_-F1f§.y = this.§_-5b§.y;
         }
         var _loc3_:Boolean = Boolean(this.hero.game) && this.hero.game.§_-M6§();
         if(this.§_-F1f§)
         {
            this.§_-F1f§.visible = _loc3_;
         }
         if(_loc3_)
         {
            Mouse.hide();
         }
         else
         {
            Mouse.show();
         }
         if(_loc2_.§_-iR§ == §_-01Z§.§_-1Z§ && this.§_-72x§ && _loc3_)
         {
            this.§_-w2U§();
         }
      }
   }
}

