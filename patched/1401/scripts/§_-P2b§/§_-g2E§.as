package §_-P2b§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-83V§.§_-o29§;
   import §_-83V§.§_-r1o§;
   import §_-RI§.§_-d2d§;
   import §_-T2y§.§_-92z§;
   import chat.§_-A1n§;
   import flash.display.MovieClip;
   import flash.events.Event;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-g2E§ extends §_-H2N§
   {
      
      private static const §_-01b§:Number = 2;
      
      private static const §_-H2a§:Number = 1;
      
      private static const §_-E1g§:int = 16;
      
      private var §_-jj§:§_-r1o§;
      
      private var §_-y2N§:int = 0;
      
      private var §_-22x§:int = 1;
      
      private var view:MovieClip;
      
      private var §_-p2K§:§_-d2d§;
      
      public function §_-g2E§(param1:Hero)
      {
         super(param1);
         this.view = new VampireMagicSelf();
         this.§_-mw§ = true;
         this.§_-it§ = §_-U1O§;
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
            this.§_-BV§(param1);
         }
      }
      
      override protected function get packets() : Array
      {
         return super.packets.concat([§_-S2I§.§_-63o§]);
      }
      
      override public function get available() : Boolean
      {
         return super.available && !this.hero.heroView.running && !this.hero.heroView.§_-k2P§;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(this.§_-jj§ != null)
         {
            this.§_-jj§.view.play();
         }
         if(this.view)
         {
            this.view.removeEventListener(Event.CHANGE,this.§_-W2D§);
         }
         if(this.§_-p2K§ != null && this.§_-p2K§.parentStarling != null)
         {
            this.§_-p2K§.removeFromParent(true);
            this.§_-p2K§.removeEventListener(Event.COMPLETE,this.§_-H2z§);
            this.§_-p2K§.removeEventListener(Event.COMPLETE,this.§_-cm§);
         }
      }
      
      override protected function activate() : void
      {
         super.activate();
         if(!this.hero.game)
         {
            return;
         }
         this.view.addEventListener(Event.CHANGE,this.§_-W2D§);
         this.view.gotoAndPlay(0);
         this.hero.§_-72F§(this.view);
         this.hero.isStopped = true;
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(Boolean(this.hero) && this.hero.id == Game.selfId)
         {
            Connection.§_-Li§(§_-h2B§.§_-w1R§,this.§_-i2D§,false,0,"");
         }
         if(this.§_-p2K§ != null && this.§_-p2K§.parentStarling != null)
         {
            this.§_-p2K§.removeEventListener(Event.COMPLETE,this.§_-H2z§);
            this.§_-p2K§.removeEventListener(Event.COMPLETE,this.§_-cm§);
            this.§_-p2K§.removeFromParent(true);
         }
         if(this.§_-jj§ != null)
         {
            this.§_-jj§.view.play();
            this.§_-p2K§ = new §_-d2d§(new VampireMagicEnd());
            this.§_-p2K§.play();
            this.§_-p2K§.loop = false;
            this.§_-p2K§.addEventListener(Event.COMPLETE,this.§_-cm§);
            this.§_-jj§.view.§_-83v§(this.§_-p2K§);
         }
         this.§_-jj§ = null;
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:int = 0;
         if(§_-g1M§)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-S2I§.§_-63o§:
               if(this.§_-jj§ == null || !(this.§_-jj§ is §_-o29§))
               {
                  return;
               }
               if(this.§_-jj§.index != param1[3])
               {
                  return;
               }
               this.§_-jj§ = null;
               this.active = false;
               break;
            case §_-S2I§.§_-w1R§:
               if(param1[2] == §_-S2I§.§_-L2G§)
               {
                  return;
               }
               if(this.hero != null && param1[1] == this.§_-i2D§ && param1[0] == this.hero.id)
               {
                  _loc2_ = int(param1[3]);
                  if(_loc2_ == -1)
                  {
                     if(this.hero.id == Game.selfId)
                     {
                        §_-92z§.sendMessage(this.hero.id,"",§_-A1n§.§_-l2p§);
                     }
                     return;
                  }
                  this.active = param1[2] == §_-S2I§.§_-EY§;
                  if(param1[2] != §_-S2I§.§_-EY§)
                  {
                     return;
                  }
                  if(!(_loc2_ in this.hero.game.map.elements))
                  {
                     return;
                  }
                  this.§_-jj§ = this.hero.game.map.elements[_loc2_];
                  this.§_-jj§.view.stop();
                  this.§_-p2K§ = new §_-d2d§(new VampireMagicStart());
                  this.§_-p2K§.play();
                  this.§_-p2K§.addEventListener(Event.COMPLETE,this.§_-H2z§);
                  this.§_-jj§.view.§_-83v§(this.§_-p2K§);
               }
               break;
            default:
               super.§_-o2C§(param1);
         }
      }
      
      private function §_-W2D§(param1:Event) : void
      {
         this.view.removeEventListener(Event.CHANGE,this.§_-W2D§);
         this.hero.isStopped = false;
         this.hero.changeView();
      }
      
      private function §_-H2z§(param1:Event) : void
      {
         if(this.§_-p2K§ != null && this.§_-p2K§.parentStarling != null)
         {
            this.§_-p2K§.removeEventListener(Event.COMPLETE,this.§_-H2z§);
            this.§_-p2K§.removeFromParent(true);
         }
         if(this.§_-jj§ != null)
         {
            this.§_-p2K§ = new §_-d2d§(new VampireMagicStand());
            this.§_-p2K§.play();
            this.§_-jj§.view.§_-83v§(this.§_-p2K§);
         }
      }
      
      private function §_-cm§(param1:Event) : void
      {
         if(this.§_-p2K§ != null && this.§_-p2K§.parentStarling != null)
         {
            this.§_-p2K§.removeEventListener(Event.COMPLETE,this.§_-cm§);
            this.§_-p2K§.removeFromParent(true);
         }
      }
      
      private function §_-BV§(param1:Number) : void
      {
         if(!(Boolean(this.hero) && Boolean(this.hero.game) && this.hero.game.map) || this.§_-jj§ == null)
         {
            return;
         }
         var _loc2_:b2Vec2 = this.hero.position.Copy();
         _loc2_.Subtract(this.§_-jj§.position);
         var _loc3_:Number = Number(_loc2_.Length());
         if(_loc3_ == 0)
         {
            return;
         }
         var _loc4_:Number = Math.min(§_-01b§ * param1,_loc3_);
         var _loc5_:Number = this.§_-jj§.position.x + _loc4_ * _loc2_.x / _loc3_;
         var _loc6_:Number = this.§_-jj§.position.y + _loc4_ * _loc2_.y / _loc3_;
         _loc5_ += Math.pow(§_-E1g§ - Math.abs(this.§_-y2N§),0.5) * this.§_-22x§ * (§_-H2a§ * param1) * (_loc2_.y / _loc3_);
         _loc6_ -= Math.pow(§_-E1g§ - Math.abs(this.§_-y2N§),0.5) * this.§_-22x§ * (§_-H2a§ * param1) * (_loc2_.x / _loc3_);
         this.§_-jj§.position = new b2Vec2(_loc5_,_loc6_);
         this.§_-y2N§ += this.§_-22x§;
         if(Math.abs(this.§_-y2N§) >= §_-E1g§)
         {
            this.§_-22x§ *= -1;
         }
      }
   }
}

