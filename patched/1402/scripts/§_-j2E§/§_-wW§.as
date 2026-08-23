package §_-j2E§
{
   import §_-5P§.§_-Z1f§;
   import §_-c2C§.§_-u24§;
   import §_-cm§.§_-Q2h§;
   import §_-n1h§.Perk;
   import chat.§_-g1j§;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import views.§_-v12§;
   
   public class §_-wW§ extends §_-92f§
   {
      
      private static const §_-u2A§:int = 3;
      
      private static const §_-z10§:Array = [0,1,2,3,4,5,6,9];
      
      private var view:MovieClip;
      
      private var §_-x13§:Array = [];
      
      private var §_-Q2A§:Array = [];
      
      public function §_-wW§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-VF§;
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get canTurnOff() : Boolean
      {
         return false;
      }
      
      override public function get totalCooldown() : Number
      {
         return 30;
      }
      
      override public function get activeTime() : Number
      {
         return 30;
      }
      
      override public function get available() : Boolean
      {
         return super.available && !this.hero.heroView.running && !this.hero.heroView.§_-52A§ && !this.active && !this.hero.§_-GB§;
      }
      
      override public function dispose() : void
      {
         if(this.view)
         {
            this.view.removeEventListener(Event.CHANGE,this.§_-C3R§);
         }
         if(this.hero)
         {
            this.hero.§_-GB§ = false;
         }
         this.§_-x13§.splice(0);
         super.dispose();
      }
      
      override public function update(param1:Number = 0) : void
      {
         var _loc3_:Hero = null;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         super.update(param1);
         if(!this.hero || !this.hero.§_-GB§ || !this.hero.game || this.§_-Q2A§.length >= §_-u2A§ || this.hero.isDead || this.hero.shaman)
         {
            return;
         }
         var _loc2_:Point = this.hero.globalToLocal(this.hero.game.localToGlobal(new Point(this.hero.heroView.§_-A3x§.x,this.hero.heroView.§_-A3x§.y))).add(new Point(this.hero.x,this.hero.y));
         for each(_loc3_ in this.hero.game.squirrels.players)
         {
            if(!(_loc3_.isHare || _loc3_.id == this.hero.id))
            {
               _loc4_ = _loc2_.add(new Point(this.hero.heroView.§_-A3x§.width * 0.5,this.hero.heroView.§_-A3x§.width * 0.5)).subtract(new Point(_loc3_.x,_loc3_.y)).length;
               _loc5_ = this.§_-x13§.indexOf(_loc3_.id);
               if(_loc3_.isDead || _loc4_ >= this.hero.heroView.§_-A3x§.width * 0.5)
               {
                  if(_loc5_ != -1)
                  {
                     this.§_-x13§.splice(_loc5_,1);
                  }
               }
               else if(_loc5_ == -1)
               {
                  this.§_-x13§.push(_loc3_.id);
               }
            }
         }
      }
      
      override protected function activate() : void
      {
         if(!this.hero || !this.hero.game || this.hero.game.paused)
         {
            this.§_-8x§ = false;
            return;
         }
         super.activate();
         this.view = new WizardAnimation();
         this.view.x = -114;
         this.view.y = -120 - Hero.§_-a1A§ * 0.5;
         this.view.addEventListener(Event.CHANGE,this.§_-C3R§);
         this.hero.addChild(this.view);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!this.hero)
         {
            return;
         }
         this.§_-x13§.splice(0);
         this.§_-Q2A§.splice(0);
         this.hero.§_-GB§ = false;
         this.hero.removeBuff(this.buff);
      }
      
      override protected function get packets() : Array
      {
         return super.packets.concat([§_-s2l§.§_-u22§]);
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Hero = null;
         if(!this.hero || this.hero.isDead || this.hero.shaman)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-s2l§.§_-C1i§:
               if(param1[2] == §_-s2l§.§_-j2o§)
               {
                  break;
               }
               if(param1[1] == this.§_-T2a§ && param1[0] == this.hero.id)
               {
                  this.active = param1[2] == §_-s2l§.§_-x2Y§;
                  return;
               }
               if(param1[0] != this.hero.id && this.hero.id == Game.selfId && this.§_-x13§.indexOf(param1[0]) != -1 && §_-z10§.indexOf(param1[1]) != -1 && param1[2] == §_-s2l§.§_-x2Y§ && this.§_-Q2A§.length < §_-u2A§)
               {
                  if(3 in param1 && param1[3] == 1)
                  {
                     return;
                  }
                  if(!this.§_-d1e§(param1[1]))
                  {
                     Connection.§_-e2T§(§_-u1O§.§_-u22§,this.§_-T2a§,param1[0],param1[1]);
                  }
                  return;
               }
               if(param1[0] == this.hero.id && this.hero.id == Game.selfId && this.§_-Q2A§.indexOf(param1[1]) != -1 && param1[2] != §_-s2l§.§_-x2Y§)
               {
                  this.§_-Q2A§.splice(this.§_-Q2A§.indexOf(param1[1]),1);
                  return;
               }
               break;
            case §_-s2l§.§_-u22§:
               if(param1[0] != this.§_-T2a§)
               {
                  return;
               }
               if(!this.hero || !this.hero.game || !this.hero.game.squirrels || this.hero.isDead || !this.hero.player)
               {
                  return;
               }
               if(this.hero.id != param1[1])
               {
                  return;
               }
               if(this.hero.id == Game.selfId)
               {
                  this.§_-Q2A§.push(param1[3]);
               }
               _loc2_ = this.hero.game.squirrels.get(param1[2]);
               if(Boolean(_loc2_) && Boolean(_loc2_.player))
               {
                  §_-u24§.sendMessage(this.hero.id,gls("Волшебник {0} получил магию «{1}» от игрока {2}",this.hero.player.nameOrig.toString(),§_-Z1f§.getName(param1[3]),_loc2_.player.nameOrig.toString()),§_-g1j§.§_-j1p§);
               }
               break;
            default:
               super.§_-x2f§(param1);
         }
      }
      
      protected function §_-C3R§(param1:Event) : void
      {
         this.view.removeEventListener(Event.CHANGE,this.§_-C3R§);
         if(!this.hero)
         {
            return;
         }
         if(this.hero.contains(this.view))
         {
            this.hero.removeChild(this.view);
         }
         if(this.hero.id != Game.selfId)
         {
            return;
         }
         this.hero.§_-GB§ = true;
         if(!this.buff)
         {
            this.buff = new §_-Q2h§(new §_-v12§(201),0.5,0,gls("Аура кражи магии"));
         }
         this.hero.§_-W1T§(this.buff);
      }
      
      private function §_-d1e§(param1:int) : Boolean
      {
         var _loc2_:Perk = null;
         for each(_loc2_ in this.hero.perkController.§_-rI§)
         {
            if(_loc2_.active && _loc2_ is §_-Z1f§.§_-vW§(param1))
            {
               return true;
            }
         }
         return false;
      }
   }
}

