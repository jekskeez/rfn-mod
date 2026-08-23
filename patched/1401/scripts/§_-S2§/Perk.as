package §_-S2§
{
   import §_-P2b§.§_-oB§;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-P1Y§;
   import §_-Y22§.§_-C2x§;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import game.mainGame.§_-Tm§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   import utils.§_-vS§;
   
   public class Perk extends EventDispatcher implements §_-Tm§, §_-C2x§
   {
      
      public static const §_-RK§:String = "STATE_CHANGED";
      
      public static var §_-u1o§:EventDispatcher = new EventDispatcher();
      
      protected var §_-dj§:Boolean = true;
      
      protected var §_-c1w§:Boolean = false;
      
      protected var §_-it§:String = "magic";
      
      protected var §_-mw§:Boolean = false;
      
      public var §_-3V§:Number = 0;
      
      public var §_-f1z§:Number = 0;
      
      public var isBlock:Boolean = false;
      
      public var §_-D1n§:int = 0;
      
      public var hero:Hero;
      
      public var §_-i2D§:int = 0;
      
      public var §_-03R§:Boolean = false;
      
      public function Perk(param1:Hero)
      {
         super();
         §_-vS§.§_-41D§(this);
         this.hero = param1;
         Connection.listen(this.§_-o2C§,this.packets,1);
      }
      
      public function §_-7J§() : void
      {
         this.§_-03R§ = true;
         Connection.§_-Li§(§_-h2B§.§_-w1R§,this.§_-i2D§,!this.active,this.target,this.json);
      }
      
      public function get isSelf() : Boolean
      {
         return Boolean(this.hero) && (this.hero.id == Game.selfId || this.hero == Hero.self);
      }
      
      public function get switchable() : Boolean
      {
         return false;
      }
      
      public function get canTurnOff() : Boolean
      {
         return true;
      }
      
      public function get active() : Boolean
      {
         return this.§_-c1w§;
      }
      
      public function get available() : Boolean
      {
         if(!this.hero)
         {
            return false;
         }
         var _loc1_:Boolean = this.§_-3V§ == 0 && this.§_-D1n§ < this.maxCountUse && this.hero.perksAvailable;
         var _loc2_:Boolean = this.switchable && this.canTurnOff;
         return this.§_-g2C§ && (this.active ? _loc2_ : _loc1_);
      }
      
      public function set active(param1:Boolean) : void
      {
         if(this.§_-c1w§ == param1)
         {
            return;
         }
         this.§_-c1w§ = param1;
         if(param1)
         {
            this.activate();
         }
         else
         {
            this.deactivate();
         }
      }
      
      public function update(param1:Number = 0) : void
      {
         if(!this.isSelf)
         {
            return;
         }
         if(this.§_-3V§ > 0)
         {
            this.§_-3V§ = Math.max(0,this.§_-3V§ - param1);
         }
         if(this.§_-f1z§ > 0)
         {
            this.§_-f1z§ -= param1;
            if(this.§_-f1z§ <= 0)
            {
               this.onComplete();
            }
         }
         if(this.§_-dj§ != this.available || this.§_-3V§ > 0 || this.§_-f1z§ > 0)
         {
            this.§_-Py§();
         }
         this.§_-dj§ = this.available;
      }
      
      public function dispose() : void
      {
         this.active = false;
         §_-vS§.§_-324§(this);
         this.hero = null;
         Connection.forget(this.§_-o2C§,this.packets);
         this.§_-Py§();
      }
      
      public function §_-S2A§() : void
      {
         this.active = false;
         this.isBlock = false;
         this.§_-D1n§ = 0;
         this.§_-3V§ = this.startCooldown;
      }
      
      public function get maxCountUse() : int
      {
         return int.MAX_VALUE;
      }
      
      public function get §_-01h§() : Boolean
      {
         return this.§_-D1n§ < this.maxCountUse;
      }
      
      public function get activeTime() : Number
      {
         return 0;
      }
      
      public function get totalCooldown() : Number
      {
         return 0;
      }
      
      public function get startCooldown() : Number
      {
         return 0;
      }
      
      public function get target() : int
      {
         return 0;
      }
      
      public function get json() : String
      {
         return "";
      }
      
      protected function onComplete() : void
      {
         this.active = false;
         if(§_-71o§.active is §_-P1Y§)
         {
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-w1R§,this.§_-i2D§,§_-S2I§.§_-33T§,0,"");
      }
      
      protected function get §_-g1M§() : Boolean
      {
         return this.hero == null || this.hero.game == null;
      }
      
      protected function get packets() : Array
      {
         return [];
      }
      
      protected function activate() : void
      {
         §_-TQ§.add("Perk.activate " + this + " " + this.hero.id);
         var _loc1_:Boolean = this.isSelf;
         if(this.§_-it§ != "" && (this.§_-mw§ && _loc1_ || !this.§_-mw§))
         {
            GameSounds.play(this.§_-it§);
         }
         if(this.switchable)
         {
            this.§_-f1z§ = this.activeTime;
         }
         else
         {
            this.active = false;
         }
      }
      
      protected function deactivate() : void
      {
         ++this.§_-D1n§;
         this.§_-3V§ = this.totalCooldown;
         this.§_-f1z§ = 0;
         this.§_-Py§();
      }
      
      protected function §_-o2C§(param1:§_-S2I§) : void
      {
      }
      
      private function get §_-g2C§() : Boolean
      {
         if(!Game.toggle)
         {
            if(this is §_-oB§)
            {
               if(this.hero)
               {
                  if(!this.hero.isDead)
                  {
                     if(!this.hero.inHollow)
                     {
                        if(!this.hero.game.paused)
                        {
                           return true;
                        }
                     }
                  }
               }
               return false;
            }
         }
         return this.hero && !this.hero.isDead && !this.hero.inHollow && !this.hero.hover && !this.hero.game.paused;
      }
      
      protected function §_-Py§() : void
      {
         if(!this.isSelf)
         {
            return;
         }
         §_-u1o§.dispatchEvent(new Event(§_-RK§));
         dispatchEvent(new Event(§_-RK§));
      }
      
      protected function §_-Z1A§() : void
      {
         this.§_-3V§ = 0;
         this.§_-Py§();
      }
   }
}

