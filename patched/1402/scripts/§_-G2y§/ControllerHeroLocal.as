package §_-G2y§
{
   import §_-92r§.§_-h23§;
   import §_-c2C§.§_-H1k§;
   import §_-c2C§.§_-S2E§;
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-u24§;
   import §_-w2b§.§_-l25§;
   import chat.§_-g1j§;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.TextField;
   import flash.ui.Keyboard;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import protocol.Connection;
   import protocol.§_-u1O§;
   
   public class ControllerHeroLocal extends §_-53o§
   {
      
      private static const §_-Ad§:int = 35000;
      
      private static const §_-J26§:int = 25000;
      
      private static const §_-s1p§:int = 10000;
      
      private static const §_-D2M§:int = 10000;
      
      private static var _instance:ControllerHeroLocal;
      
      private static var §_-s1i§:Boolean = false;
      
      private var §_-B28§:Boolean = false;
      
      private var §_-ZM§:Boolean = false;
      
      private var §_-S1v§:Boolean = false;
      
      private var §_-53h§:Boolean = false;
      
      private var §_-EI§:Timer = new Timer(§_-Ad§,1);
      
      private var §_-1u§:Timer = new Timer(§_-D2M§,1);
      
      private var §_-B3l§:Timer = new Timer(§_-s1p§,1);
      
      private var §_-ZJ§:Number = 35000;
      
      private var §_-72L§:§_-h23§ = new §_-h23§();
      
      private var §_-P9§:§_-l25§ = null;
      
      public function ControllerHeroLocal(param1:§_-V2D§, param2:Boolean = true)
      {
         _instance = this;
         §_-p2U§.add("ControllerHeroLocal.ControllerHeroLocal " + param2);
         super(param1);
         this.§_-53h§ = param2;
         this.hero.§_-vs§ = param2;
         this.hero.§_-21b§(this);
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-r1i§,false,0,true);
         Game.stage.addEventListener(KeyboardEvent.KEY_UP,this.§_-r1i§,false,0,true);
         Game.stage.addEventListener(MouseEvent.CLICK,this.§_-H1h§,false,0,true);
         var _loc3_:Boolean = (param1 as Hero).id == Game.selfId || (param1 as Hero).id <= 0;
         if(§_-Zy§.§_-e2k§ && _loc3_ && (this.§_-53h§ || §_-t2c§.active is §_-S2E§))
         {
            if(this.§_-P9§)
            {
               this.§_-P9§.remove();
               this.§_-P9§ = null;
            }
            this.§_-P9§ = new §_-l25§(this);
         }
         if(!this.§_-53h§)
         {
            return;
         }
         this.§_-EI§.addEventListener(TimerEvent.TIMER,this.§_-J1w§,false,0,true);
         this.§_-EI§.reset();
         this.§_-EI§.start();
         this.§_-1u§.addEventListener(TimerEvent.TIMER,this.onKick,false,0,true);
         this.§_-B3l§.addEventListener(TimerEvent.TIMER,this.§_-r7§,false,0,true);
         this.§_-B3l§.reset();
         this.§_-B3l§.start();
      }
      
      public static function §_-11C§() : void
      {
         if(_instance)
         {
            _instance.§_-11C§();
         }
      }
      
      public static function get §_-T16§() : Boolean
      {
         if(Boolean(_instance) && Boolean(_instance.hero) && _instance.hero.shaman)
         {
            return true;
         }
         return §_-s1i§;
      }
      
      public static function set §_-T16§(param1:Boolean) : void
      {
         if(Boolean(_instance) && Boolean(_instance.hero) && _instance.hero.shaman)
         {
            param1 = true;
         }
         §_-s1i§ = param1;
      }
      
      override public function set active(param1:Boolean) : void
      {
         param1 = ControllerHeroLocal.§_-T16§ ? param1 : false;
         var _loc2_:Number = Boolean(this.hero) && this.hero.shaman ? §_-J26§ : §_-Ad§;
         if(this.§_-8x§ != param1 || _loc2_ != this.§_-ZJ§)
         {
            this.§_-ZJ§ = _loc2_;
            this.§_-EI§.delay = this.§_-ZJ§;
            this.§_-EI§.reset();
            this.§_-1u§.stop();
            this.§_-72L§.hide();
            if(param1)
            {
               this.§_-EI§.start();
               this.§_-B3l§.start();
            }
            else
            {
               this.§_-B3l§.stop();
            }
         }
         super.active = param1;
      }
      
      override public function remove() : void
      {
         §_-p2U§.add("ControllerHeroLocal.remove");
         if(this.§_-P9§)
         {
            this.§_-P9§.remove();
            this.§_-P9§ = null;
         }
         super.remove();
         Game.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-r1i§);
         Game.stage.removeEventListener(KeyboardEvent.KEY_UP,this.§_-r1i§);
         Game.stage.removeEventListener(MouseEvent.CLICK,this.§_-H1h§);
         this.§_-72L§.hide();
         this.§_-1u§.stop();
         this.§_-EI§.stop();
         this.§_-EI§.removeEventListener(TimerEvent.TIMER,this.§_-J1w§);
         this.§_-B3l§.stop();
         this.§_-B3l§.removeEventListener(TimerEvent.TIMER,this.§_-r7§);
         this.hero = null;
      }
      
      private function §_-J1w§(param1:TimerEvent) : void
      {
         if(!this.§_-8x§ || this.§_-22g§ || §_-t2c§.active is §_-H1k§)
         {
            return;
         }
         this.§_-72L§.show();
         this.§_-72L§.§_-lQ§ = §_-D2M§ / 1000 + 1;
         this.§_-1u§.reset();
         this.§_-1u§.start();
      }
      
      private function onKick(param1:TimerEvent) : void
      {
         if(!this.§_-8x§ || this.§_-22g§ || §_-t2c§.active is §_-H1k§)
         {
            return;
         }
         §_-p2U§.add("ControllerHeroLocal.onKick");
         §_-t2c§.§_-M1K§ = true;
         Connection.§_-e2T§(§_-u1O§.§_-M15§);
      }
      
      private function §_-r7§(param1:TimerEvent) : void
      {
         if(!this.§_-8x§)
         {
            return;
         }
         this.§_-vs§(0,false);
      }
      
      public function §_-r1i§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == 118)
         {
            if(param1.type == KeyboardEvent.KEY_DOWN)
            {
               if(Game.toggle)
               {
                  §_-u24§.sendMessage(Game.selfId,"Сначала включите модификации.",§_-g1j§.§_-j1p§);
                  return;
               }
               if(Game.activated)
               {
                  if(Hero.self != null)
                  {
                     Hero.self.immortal = Game.immortal;
                  }
                  Game.activated = false;
                  Game.state = 0;
                  Game.target = null;
                  §_-u24§.sendMessage(Game.selfId,"Автосбор выключен.",§_-g1j§.§_-j1p§);
                  return;
               }
               if(Hero.self == null)
               {
                  §_-u24§.sendMessage(Game.selfId,"Автосбор недоступен.",§_-g1j§.§_-j1p§);
                  return;
               }
               Game.immortal = Hero.self.immortal;
               Game.activated = true;
               Hero.self.immortal = true;
               Game.state = 1;
               Game.time = getTimer();
               Game.target = null;
               §_-u24§.sendMessage(Game.selfId,"Автосбор включён.",§_-g1j§.§_-j1p§);
               return;
            }
         }
         if(param1.keyCode == 119)
         {
            if(param1.type == KeyboardEvent.KEY_DOWN)
            {
               Game.toggle = !Game.toggle;
               if(!Game.toggle)
               {
                  §_-u24§.sendMessage(Game.selfId,"Модификации включены.",§_-g1j§.§_-j1p§);
                  return;
               }
               §_-u24§.sendMessage(Game.selfId,"Модификации выключены.",§_-g1j§.§_-j1p§);
               return;
            }
         }
         var _loc2_:Boolean = param1.type == KeyboardEvent.KEY_DOWN;
         if(this.hero == null)
         {
            return;
         }
         if(Boolean(Game.chat) && Game.chat.hasFocus())
         {
            this.§_-11C§();
            if(_loc2_)
            {
               return;
            }
         }
         if(!(Game.stage.focus is TextField))
         {
            Game.stage.focus = Game.stage;
         }
         if(param1.type != KeyboardEvent.KEY_DOWN && param1.type != KeyboardEvent.KEY_UP)
         {
            return;
         }
         switch(param1.keyCode)
         {
            case Keyboard.W:
            case Keyboard.SPACE:
            case Keyboard.UP:
               if(this.§_-S1v§ == _loc2_ || this.§_-22g§)
               {
                  return;
               }
               this.§_-S1v§ = _loc2_;
               this.§_-vs§(param1.keyCode * (_loc2_ ? 1 : -1));
               this.hero.jump(_loc2_);
               break;
            case Keyboard.A:
            case Keyboard.LEFT:
               if(this.§_-B28§ == _loc2_ || this.§_-22g§)
               {
                  return;
               }
               this.§_-B28§ = _loc2_;
               this.§_-vs§(param1.keyCode * (_loc2_ ? 1 : -1));
               this.hero.moveLeft(_loc2_);
               break;
            case Keyboard.D:
            case Keyboard.RIGHT:
               if(this.§_-ZM§ == _loc2_ || this.§_-22g§)
               {
                  return;
               }
               this.§_-ZM§ = _loc2_;
               this.§_-vs§(param1.keyCode * (_loc2_ ? 1 : -1));
               this.hero.moveRight(_loc2_);
               break;
            case Keyboard.F1:
            case Keyboard.F2:
            case Keyboard.F3:
            case Keyboard.F4:
               if(!this.hero.shaman || !_loc2_)
               {
                  return;
               }
               this.§_-vs§(param1.keyCode);
               this.hero.§_-73j§(param1.keyCode - 111);
         }
      }
      
      private function §_-H1h§(param1:MouseEvent) : void
      {
         this.§_-11C§();
      }
      
      private function §_-vs§(param1:int, param2:Boolean = true) : void
      {
         if(!this.§_-53h§)
         {
            return;
         }
         this.hero.sendLocation(param1);
         this.§_-G8§();
         if(param2)
         {
            this.§_-11C§();
         }
      }
      
      private function §_-11C§() : void
      {
         this.§_-72L§.hide();
         this.§_-1u§.stop();
         this.§_-EI§.reset();
         this.§_-EI§.start();
      }
      
      private function §_-G8§() : void
      {
         this.§_-B3l§.reset();
         this.§_-B3l§.start();
      }
   }
}

