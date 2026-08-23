package §_-j2E§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-8Q§.§_-r2M§;
   import §_-8Q§.§_-u1i§;
   import §_-TK§.§_-f1u§;
   import §_-c2C§.§_-u24§;
   import chat.§_-g1j§;
   import flash.display.MovieClip;
   import flash.events.Event;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-C1y§ extends §_-92f§
   {
      
      private static const §_-Bs§:Number = 2;
      
      private static const §_-Vv§:Number = 1;
      
      private static const §_-m2C§:int = 16;
      
      private var §_-IT§:§_-r2M§;
      
      private var §_-lC§:int = 0;
      
      private var §_-S1t§:int = 1;
      
      private var view:MovieClip;
      
      private var §_-I2a§:§_-f1u§;
      
      public function §_-C1y§(param1:Hero)
      {
         super(param1);
         this.view = new VampireMagicSelf();
         this.§_-i1J§ = true;
         this.§_-S2A§ = §_-n19§;
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get totalCooldown() : Number
      {
         return 40;
      }
      
      override public function get activeTime() : Number
      {
         return 15;
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.active)
         {
            this.§_-ug§(param1);
         }
      }
      
      override protected function get packets() : Array
      {
         return super.packets.concat([§_-s2l§.§_-kF§]);
      }
      
      override public function get available() : Boolean
      {
         return super.available && !this.hero.heroView.running && !this.hero.heroView.§_-52A§;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(this.§_-IT§ != null)
         {
            this.§_-IT§.view.play();
         }
         if(this.view)
         {
            this.view.removeEventListener(Event.CHANGE,this.§_-pc§);
         }
         if(this.§_-I2a§ != null && this.§_-I2a§.parentStarling != null)
         {
            this.§_-I2a§.removeFromParent(true);
            this.§_-I2a§.removeEventListener(Event.COMPLETE,this.§_-BD§);
            this.§_-I2a§.removeEventListener(Event.COMPLETE,this.§_-y1m§);
         }
      }
      
      override protected function activate() : void
      {
         super.activate();
         if(!this.hero.game)
         {
            return;
         }
         this.view.addEventListener(Event.CHANGE,this.§_-pc§);
         this.view.gotoAndPlay(0);
         this.hero.§_-s28§(this.view);
         this.hero.isStopped = true;
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(Boolean(this.hero) && this.hero.id == Game.selfId)
         {
            Connection.§_-e2T§(§_-u1O§.§_-C1i§,this.§_-T2a§,false,0,"");
         }
         if(this.§_-I2a§ != null && this.§_-I2a§.parentStarling != null)
         {
            this.§_-I2a§.removeEventListener(Event.COMPLETE,this.§_-BD§);
            this.§_-I2a§.removeEventListener(Event.COMPLETE,this.§_-y1m§);
            this.§_-I2a§.removeFromParent(true);
         }
         if(this.§_-IT§ != null)
         {
            this.§_-IT§.view.play();
            this.§_-I2a§ = new §_-f1u§(new VampireMagicEnd());
            this.§_-I2a§.play();
            this.§_-I2a§.loop = false;
            this.§_-I2a§.addEventListener(Event.COMPLETE,this.§_-y1m§);
            this.§_-IT§.view.§_-J2J§(this.§_-I2a§);
         }
         this.§_-IT§ = null;
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:int = 0;
         if(§_-x2b§)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-s2l§.§_-kF§:
               if(this.§_-IT§ == null || !(this.§_-IT§ is §_-u1i§))
               {
                  return;
               }
               if(this.§_-IT§.index != param1[3])
               {
                  return;
               }
               this.§_-IT§ = null;
               this.active = false;
               break;
            case §_-s2l§.§_-C1i§:
               if(param1[2] == §_-s2l§.§_-j2o§)
               {
                  return;
               }
               if(this.hero != null && param1[1] == this.§_-T2a§ && param1[0] == this.hero.id)
               {
                  _loc2_ = int(param1[3]);
                  if(_loc2_ == -1)
                  {
                     if(this.hero.id == Game.selfId)
                     {
                        §_-u24§.sendMessage(this.hero.id,"",§_-g1j§.§_-t1E§);
                     }
                     return;
                  }
                  this.active = param1[2] == §_-s2l§.§_-x2Y§;
                  if(param1[2] != §_-s2l§.§_-x2Y§)
                  {
                     return;
                  }
                  if(!(_loc2_ in this.hero.game.map.elements))
                  {
                     return;
                  }
                  this.§_-IT§ = this.hero.game.map.elements[_loc2_];
                  this.§_-IT§.view.stop();
                  this.§_-I2a§ = new §_-f1u§(new VampireMagicStart());
                  this.§_-I2a§.play();
                  this.§_-I2a§.addEventListener(Event.COMPLETE,this.§_-BD§);
                  this.§_-IT§.view.§_-J2J§(this.§_-I2a§);
               }
               break;
            default:
               super.§_-x2f§(param1);
         }
      }
      
      private function §_-pc§(param1:Event) : void
      {
         this.view.removeEventListener(Event.CHANGE,this.§_-pc§);
         this.hero.isStopped = false;
         this.hero.changeView();
      }
      
      private function §_-BD§(param1:Event) : void
      {
         if(this.§_-I2a§ != null && this.§_-I2a§.parentStarling != null)
         {
            this.§_-I2a§.removeEventListener(Event.COMPLETE,this.§_-BD§);
            this.§_-I2a§.removeFromParent(true);
         }
         if(this.§_-IT§ != null)
         {
            this.§_-I2a§ = new §_-f1u§(new VampireMagicStand());
            this.§_-I2a§.play();
            this.§_-IT§.view.§_-J2J§(this.§_-I2a§);
         }
      }
      
      private function §_-y1m§(param1:Event) : void
      {
         if(this.§_-I2a§ != null && this.§_-I2a§.parentStarling != null)
         {
            this.§_-I2a§.removeEventListener(Event.COMPLETE,this.§_-y1m§);
            this.§_-I2a§.removeFromParent(true);
         }
      }
      
      private function §_-ug§(param1:Number) : void
      {
         if(!(Boolean(this.hero) && Boolean(this.hero.game) && this.hero.game.map) || this.§_-IT§ == null)
         {
            return;
         }
         var _loc2_:b2Vec2 = this.hero.position.Copy();
         _loc2_.Subtract(this.§_-IT§.position);
         var _loc3_:Number = Number(_loc2_.Length());
         if(_loc3_ == 0)
         {
            return;
         }
         var _loc4_:Number = Math.min(§_-Bs§ * param1,_loc3_);
         var _loc5_:Number = this.§_-IT§.position.x + _loc4_ * _loc2_.x / _loc3_;
         var _loc6_:Number = this.§_-IT§.position.y + _loc4_ * _loc2_.y / _loc3_;
         _loc5_ += Math.pow(§_-m2C§ - Math.abs(this.§_-lC§),0.5) * this.§_-S1t§ * (§_-Vv§ * param1) * (_loc2_.y / _loc3_);
         _loc6_ -= Math.pow(§_-m2C§ - Math.abs(this.§_-lC§),0.5) * this.§_-S1t§ * (§_-Vv§ * param1) * (_loc2_.x / _loc3_);
         this.§_-IT§.position = new b2Vec2(_loc5_,_loc6_);
         this.§_-lC§ += this.§_-S1t§;
         if(Math.abs(this.§_-lC§) >= §_-m2C§)
         {
            this.§_-S1t§ *= -1;
         }
      }
   }
}

