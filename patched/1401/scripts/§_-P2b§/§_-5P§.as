package §_-P2b§
{
   import §_-1§.§_-tY§;
   import §_-S2§.Perk;
   import §_-T1r§.§_-03i§;
   import §_-T2y§.§_-92z§;
   import chat.§_-A1n§;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import views.§_-63X§;
   
   public class §_-5P§ extends §_-H2N§
   {
      
      private static const §_-Z0§:int = 3;
      
      private static const §_-92t§:Array = [0,1,2,3,4,5,6,9];
      
      private var view:MovieClip;
      
      private var §_-Q2H§:Array = [];
      
      private var §_-H2V§:Array = [];
      
      public function §_-5P§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = §_-iP§;
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
         return super.available && !this.hero.heroView.running && !this.hero.heroView.§_-k2P§ && !this.active && !this.hero.§_-129§;
      }
      
      override public function dispose() : void
      {
         if(this.view)
         {
            this.view.removeEventListener(Event.CHANGE,this.§_-b2I§);
         }
         if(this.hero)
         {
            this.hero.§_-129§ = false;
         }
         this.§_-Q2H§.splice(0);
         super.dispose();
      }
      
      override public function update(param1:Number = 0) : void
      {
         var _loc3_:Hero = null;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         super.update(param1);
         if(!this.hero || !this.hero.§_-129§ || !this.hero.game || this.§_-H2V§.length >= §_-Z0§ || this.hero.isDead || this.hero.shaman)
         {
            return;
         }
         var _loc2_:Point = this.hero.globalToLocal(this.hero.game.localToGlobal(new Point(this.hero.heroView.§_-s7§.x,this.hero.heroView.§_-s7§.y))).add(new Point(this.hero.x,this.hero.y));
         for each(_loc3_ in this.hero.game.squirrels.players)
         {
            if(!(_loc3_.isHare || _loc3_.id == this.hero.id))
            {
               _loc4_ = _loc2_.add(new Point(this.hero.heroView.§_-s7§.width * 0.5,this.hero.heroView.§_-s7§.width * 0.5)).subtract(new Point(_loc3_.x,_loc3_.y)).length;
               _loc5_ = this.§_-Q2H§.indexOf(_loc3_.id);
               if(_loc3_.isDead || _loc4_ >= this.hero.heroView.§_-s7§.width * 0.5)
               {
                  if(_loc5_ != -1)
                  {
                     this.§_-Q2H§.splice(_loc5_,1);
                  }
               }
               else if(_loc5_ == -1)
               {
                  this.§_-Q2H§.push(_loc3_.id);
               }
            }
         }
      }
      
      override protected function activate() : void
      {
         if(!this.hero || !this.hero.game || this.hero.game.paused)
         {
            this.§_-c1w§ = false;
            return;
         }
         super.activate();
         this.view = new WizardAnimation();
         this.view.x = -114;
         this.view.y = -120 - Hero.§_-YH§ * 0.5;
         this.view.addEventListener(Event.CHANGE,this.§_-b2I§);
         this.hero.addChild(this.view);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!this.hero)
         {
            return;
         }
         this.§_-Q2H§.splice(0);
         this.§_-H2V§.splice(0);
         this.hero.§_-129§ = false;
         this.hero.removeBuff(this.buff);
      }
      
      override protected function get packets() : Array
      {
         return super.packets.concat([§_-S2I§.§_-Q1g§]);
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Hero = null;
         if(!this.hero || this.hero.isDead || this.hero.shaman)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-S2I§.§_-w1R§:
               if(param1[2] == §_-S2I§.§_-L2G§)
               {
                  break;
               }
               if(param1[1] == this.§_-i2D§ && param1[0] == this.hero.id)
               {
                  this.active = param1[2] == §_-S2I§.§_-EY§;
                  return;
               }
               if(param1[0] != this.hero.id && this.hero.id == Game.selfId && this.§_-Q2H§.indexOf(param1[0]) != -1 && §_-92t§.indexOf(param1[1]) != -1 && param1[2] == §_-S2I§.§_-EY§ && this.§_-H2V§.length < §_-Z0§)
               {
                  if(3 in param1 && param1[3] == 1)
                  {
                     return;
                  }
                  if(!this.§_-n1k§(param1[1]))
                  {
                     Connection.§_-Li§(§_-h2B§.§_-Q1g§,this.§_-i2D§,param1[0],param1[1]);
                  }
                  return;
               }
               if(param1[0] == this.hero.id && this.hero.id == Game.selfId && this.§_-H2V§.indexOf(param1[1]) != -1 && param1[2] != §_-S2I§.§_-EY§)
               {
                  this.§_-H2V§.splice(this.§_-H2V§.indexOf(param1[1]),1);
                  return;
               }
               break;
            case §_-S2I§.§_-Q1g§:
               if(param1[0] != this.§_-i2D§)
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
                  this.§_-H2V§.push(param1[3]);
               }
               _loc2_ = this.hero.game.squirrels.get(param1[2]);
               if(Boolean(_loc2_) && Boolean(_loc2_.player))
               {
                  §_-92z§.sendMessage(this.hero.id,gls("Волшебник {0} получил магию «{1}» от игрока {2}",this.hero.player.nameOrig.toString(),§_-tY§.getName(param1[3]),_loc2_.player.nameOrig.toString()),§_-A1n§.§_-N1c§);
               }
               break;
            default:
               super.§_-o2C§(param1);
         }
      }
      
      protected function §_-b2I§(param1:Event) : void
      {
         this.view.removeEventListener(Event.CHANGE,this.§_-b2I§);
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
         this.hero.§_-129§ = true;
         if(!this.buff)
         {
            this.buff = new §_-03i§(new §_-63X§(201),0.5,0,gls("Аура кражи магии"));
         }
         this.hero.§_-Aj§(this.buff);
      }
      
      private function §_-n1k§(param1:int) : Boolean
      {
         var _loc2_:Perk = null;
         for each(_loc2_ in this.hero.perkController.§_-s13§)
         {
            if(_loc2_.active && _loc2_ is §_-tY§.§_-xZ§(param1))
            {
               return true;
            }
         }
         return false;
      }
   }
}

