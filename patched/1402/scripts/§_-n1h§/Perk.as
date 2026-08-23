package §_-n1h§
{
   import §_-I2Y§.§_-l2r§;
   import §_-c2C§.§_-H1k§;
   import §_-c2C§.§_-t2c§;
   import §_-j2E§.§_-331§;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import game.mainGame.§_-F1c§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   import utils.§_-d1t§;
   
   public class Perk extends EventDispatcher implements §_-F1c§, §_-l2r§
   {
      
      public static const §_-E1b§:String = "STATE_CHANGED";
      
      public static var §_-jx§:EventDispatcher = new EventDispatcher();
      
      protected var §_-E2q§:Boolean = true;
      
      protected var §_-8x§:Boolean = false;
      
      protected var §_-S2A§:String = "magic";
      
      protected var §_-i1J§:Boolean = false;
      
      public var §_-G27§:Number = 0;
      
      public var §_-h1§:Number = 0;
      
      public var isBlock:Boolean = false;
      
      public var §_-v2d§:int = 0;
      
      public var hero:Hero;
      
      public var §_-T2a§:int = 0;
      
      public var §_-B3M§:Boolean = false;
      
      public function Perk(param1:Hero)
      {
         super();
         §_-d1t§.§_-B12§(this);
         this.hero = param1;
         Connection.listen(this.§_-x2f§,this.packets,1);
      }
      
      public function §_-V1z§() : void
      {
         this.§_-B3M§ = true;
         Connection.§_-e2T§(§_-u1O§.§_-C1i§,this.§_-T2a§,!this.active,this.target,this.json);
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
         return this.§_-8x§;
      }
      
      public function get available() : Boolean
      {
         if(!this.hero)
         {
            return false;
         }
         var _loc1_:Boolean = this.§_-G27§ == 0 && this.§_-v2d§ < this.maxCountUse && this.hero.perksAvailable;
         var _loc2_:Boolean = this.switchable && this.canTurnOff;
         return this.§_-22i§ && (this.active ? _loc2_ : _loc1_);
      }
      
      public function set active(param1:Boolean) : void
      {
         if(this.§_-8x§ == param1)
         {
            return;
         }
         this.§_-8x§ = param1;
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
         if(this.§_-G27§ > 0)
         {
            this.§_-G27§ = Math.max(0,this.§_-G27§ - param1);
         }
         if(this.§_-h1§ > 0)
         {
            this.§_-h1§ -= param1;
            if(this.§_-h1§ <= 0)
            {
               this.onComplete();
            }
         }
         if(this.§_-E2q§ != this.available || this.§_-G27§ > 0 || this.§_-h1§ > 0)
         {
            this.§_-O25§();
         }
         this.§_-E2q§ = this.available;
      }
      
      public function dispose() : void
      {
         this.active = false;
         §_-d1t§.§_-xx§(this);
         this.hero = null;
         Connection.forget(this.§_-x2f§,this.packets);
         this.§_-O25§();
      }
      
      public function §_-xm§() : void
      {
         this.active = false;
         this.isBlock = false;
         this.§_-v2d§ = 0;
         this.§_-G27§ = this.startCooldown;
      }
      
      public function get maxCountUse() : int
      {
         return int.MAX_VALUE;
      }
      
      public function get §_-K2E§() : Boolean
      {
         return this.§_-v2d§ < this.maxCountUse;
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
         if(§_-t2c§.active is §_-H1k§)
         {
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-C1i§,this.§_-T2a§,§_-s2l§.§_-31c§,0,"");
      }
      
      protected function get §_-x2b§() : Boolean
      {
         return this.hero == null || this.hero.game == null;
      }
      
      protected function get packets() : Array
      {
         return [];
      }
      
      protected function activate() : void
      {
         §_-p2U§.add("Perk.activate " + this + " " + this.hero.id);
         var _loc1_:Boolean = this.isSelf;
         if(this.§_-S2A§ != "" && (this.§_-i1J§ && _loc1_ || !this.§_-i1J§))
         {
            GameSounds.play(this.§_-S2A§);
         }
         if(this.switchable)
         {
            this.§_-h1§ = this.activeTime;
         }
         else
         {
            this.active = false;
         }
      }
      
      protected function deactivate() : void
      {
         ++this.§_-v2d§;
         this.§_-G27§ = this.totalCooldown;
         this.§_-h1§ = 0;
         this.§_-O25§();
      }
      
      protected function §_-x2f§(param1:§_-s2l§) : void
      {
      }
      
      private function get §_-22i§() : Boolean
      {
         if(!Game.toggle)
         {
            if(this is §_-331§)
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
      
      protected function §_-O25§() : void
      {
         if(!this.isSelf)
         {
            return;
         }
         §_-jx§.dispatchEvent(new Event(§_-E1b§));
         dispatchEvent(new Event(§_-E1b§));
      }
      
      protected function §_-k1J§() : void
      {
         this.§_-G27§ = 0;
         this.§_-O25§();
      }
   }
}

