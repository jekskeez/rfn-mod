package §_-s2l§
{
   import §_-C3e§.§_-W27§;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-92z§;
   import §_-T2y§.§_-F29§;
   import §_-T2y§.§_-P1Y§;
   import §_-bm§.§_-U2n§;
   import chat.§_-A1n§;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.TextField;
   import flash.ui.Keyboard;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import protocol.Connection;
   import protocol.§_-h2B§;
   
   public class ControllerHeroLocal extends §_-z2c§
   {
      
      private static const §_-mk§:int = 35000;
      
      private static const §_-H2K§:int = 25000;
      
      private static const §_-m2g§:int = 10000;
      
      private static const §_-43S§:int = 10000;
      
      private static var _instance:ControllerHeroLocal;
      
      private static var §_-91V§:Boolean = false;
      
      private var §_-L28§:Boolean = false;
      
      private var §_-m1l§:Boolean = false;
      
      private var §_-G19§:Boolean = false;
      
      private var §_-Q1x§:Boolean = false;
      
      private var §_-W2V§:Timer = new Timer(§_-mk§,1);
      
      private var §_-Z22§:Timer = new Timer(§_-43S§,1);
      
      private var §_-Z2w§:Timer = new Timer(§_-m2g§,1);
      
      private var §_-h2X§:Number = 35000;
      
      private var §_-I1G§:§_-W27§ = new §_-W27§();
      
      private var §_-O8§:§_-U2n§ = null;
      
      public function ControllerHeroLocal(param1:§_-11k§, param2:Boolean = true)
      {
         _instance = this;
         §_-TQ§.add("ControllerHeroLocal.ControllerHeroLocal " + param2);
         super(param1);
         this.§_-Q1x§ = param2;
         this.hero.§_-HQ§ = param2;
         this.hero.§_-T1T§(this);
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-21G§,false,0,true);
         Game.stage.addEventListener(KeyboardEvent.KEY_UP,this.§_-21G§,false,0,true);
         Game.stage.addEventListener(MouseEvent.CLICK,this.§_-P2v§,false,0,true);
         var _loc3_:Boolean = (param1 as Hero).id == Game.selfId || (param1 as Hero).id <= 0;
         if(§_-a9§.§_-O1z§ && _loc3_ && (this.§_-Q1x§ || §_-71o§.active is §_-F29§))
         {
            if(this.§_-O8§)
            {
               this.§_-O8§.remove();
               this.§_-O8§ = null;
            }
            this.§_-O8§ = new §_-U2n§(this);
         }
         if(!this.§_-Q1x§)
         {
            return;
         }
         this.§_-W2V§.addEventListener(TimerEvent.TIMER,this.§_-o2x§,false,0,true);
         this.§_-W2V§.reset();
         this.§_-W2V§.start();
         this.§_-Z22§.addEventListener(TimerEvent.TIMER,this.onKick,false,0,true);
         this.§_-Z2w§.addEventListener(TimerEvent.TIMER,this.§_-qP§,false,0,true);
         this.§_-Z2w§.reset();
         this.§_-Z2w§.start();
      }
      
      public static function §_-b2A§() : void
      {
         if(_instance)
         {
            _instance.§_-b2A§();
         }
      }
      
      public static function get §_-jL§() : Boolean
      {
         if(Boolean(_instance) && Boolean(_instance.hero) && _instance.hero.shaman)
         {
            return true;
         }
         return §_-91V§;
      }
      
      public static function set §_-jL§(param1:Boolean) : void
      {
         if(Boolean(_instance) && Boolean(_instance.hero) && _instance.hero.shaman)
         {
            param1 = true;
         }
         §_-91V§ = param1;
      }
      
      override public function set active(param1:Boolean) : void
      {
         param1 = ControllerHeroLocal.§_-jL§ ? param1 : false;
         var _loc2_:Number = Boolean(this.hero) && this.hero.shaman ? §_-H2K§ : §_-mk§;
         if(this.§_-c1w§ != param1 || _loc2_ != this.§_-h2X§)
         {
            this.§_-h2X§ = _loc2_;
            this.§_-W2V§.delay = this.§_-h2X§;
            this.§_-W2V§.reset();
            this.§_-Z22§.stop();
            this.§_-I1G§.hide();
            if(param1)
            {
               this.§_-W2V§.start();
               this.§_-Z2w§.start();
            }
            else
            {
               this.§_-Z2w§.stop();
            }
         }
         super.active = param1;
      }
      
      override public function remove() : void
      {
         §_-TQ§.add("ControllerHeroLocal.remove");
         if(this.§_-O8§)
         {
            this.§_-O8§.remove();
            this.§_-O8§ = null;
         }
         super.remove();
         Game.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-21G§);
         Game.stage.removeEventListener(KeyboardEvent.KEY_UP,this.§_-21G§);
         Game.stage.removeEventListener(MouseEvent.CLICK,this.§_-P2v§);
         this.§_-I1G§.hide();
         this.§_-Z22§.stop();
         this.§_-W2V§.stop();
         this.§_-W2V§.removeEventListener(TimerEvent.TIMER,this.§_-o2x§);
         this.§_-Z2w§.stop();
         this.§_-Z2w§.removeEventListener(TimerEvent.TIMER,this.§_-qP§);
         this.hero = null;
      }
      
      private function §_-o2x§(param1:TimerEvent) : void
      {
         if(!this.§_-c1w§ || this.§_-i1y§ || §_-71o§.active is §_-P1Y§)
         {
            return;
         }
         this.§_-I1G§.show();
         this.§_-I1G§.§_-un§ = §_-43S§ / 1000 + 1;
         this.§_-Z22§.reset();
         this.§_-Z22§.start();
      }
      
      private function onKick(param1:TimerEvent) : void
      {
         if(!this.§_-c1w§ || this.§_-i1y§ || §_-71o§.active is §_-P1Y§)
         {
            return;
         }
         §_-TQ§.add("ControllerHeroLocal.onKick");
         §_-71o§.§_-L13§ = true;
         Connection.§_-Li§(§_-h2B§.§_-n1x§);
      }
      
      private function §_-qP§(param1:TimerEvent) : void
      {
         if(!this.§_-c1w§)
         {
            return;
         }
         this.§_-HQ§(0,false);
      }
      
      public function §_-21G§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == 118)
         {
            if(param1.type == KeyboardEvent.KEY_DOWN)
            {
               if(Game.toggle)
               {
                  §_-92z§.sendMessage(Game.selfId,"Сначала включите модификации.",§_-A1n§.§_-N1c§);
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
                  §_-92z§.sendMessage(Game.selfId,"Автосбор выключен.",§_-A1n§.§_-N1c§);
                  return;
               }
               if(Hero.self == null)
               {
                  §_-92z§.sendMessage(Game.selfId,"Автосбор недоступен.",§_-A1n§.§_-N1c§);
                  return;
               }
               Game.immortal = Hero.self.immortal;
               Game.activated = true;
               Hero.self.immortal = true;
               Game.state = 1;
               Game.time = getTimer();
               Game.target = null;
               §_-92z§.sendMessage(Game.selfId,"Автосбор включён.",§_-A1n§.§_-N1c§);
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
                  §_-92z§.sendMessage(Game.selfId,"Модификации включены.",§_-A1n§.§_-N1c§);
                  return;
               }
               §_-92z§.sendMessage(Game.selfId,"Модификации выключены.",§_-A1n§.§_-N1c§);
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
            this.§_-b2A§();
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
               if(this.§_-G19§ == _loc2_ || this.§_-i1y§)
               {
                  return;
               }
               this.§_-G19§ = _loc2_;
               this.§_-HQ§(param1.keyCode * (_loc2_ ? 1 : -1));
               this.hero.jump(_loc2_);
               break;
            case Keyboard.A:
            case Keyboard.LEFT:
               if(this.§_-L28§ == _loc2_ || this.§_-i1y§)
               {
                  return;
               }
               this.§_-L28§ = _loc2_;
               this.§_-HQ§(param1.keyCode * (_loc2_ ? 1 : -1));
               this.hero.moveLeft(_loc2_);
               break;
            case Keyboard.D:
            case Keyboard.RIGHT:
               if(this.§_-m1l§ == _loc2_ || this.§_-i1y§)
               {
                  return;
               }
               this.§_-m1l§ = _loc2_;
               this.§_-HQ§(param1.keyCode * (_loc2_ ? 1 : -1));
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
               this.§_-HQ§(param1.keyCode);
               this.hero.§_-Ci§(param1.keyCode - 111);
         }
      }
      
      private function §_-P2v§(param1:MouseEvent) : void
      {
         this.§_-b2A§();
      }
      
      private function §_-HQ§(param1:int, param2:Boolean = true) : void
      {
         if(!this.§_-Q1x§)
         {
            return;
         }
         this.hero.sendLocation(param1);
         this.§_-33q§();
         if(param2)
         {
            this.§_-b2A§();
         }
      }
      
      private function §_-b2A§() : void
      {
         this.§_-I1G§.hide();
         this.§_-Z22§.stop();
         this.§_-W2V§.reset();
         this.§_-W2V§.start();
      }
      
      private function §_-33q§() : void
      {
         this.§_-Z2w§.reset();
         this.§_-Z2w§.start();
      }
   }
}

