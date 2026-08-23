package
{
   import §_-c2C§.§_-u24§;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.geom.Rectangle;
   import flash.text.TextFormat;
   import flash.ui.Keyboard;
   import flash.utils.getTimer;
   import protocol.Connection;
   import protocol.§_-u1O§;
   import starling.utils.§_-42b§;
   import starling.utils.§_-U2x§;
   
   public class §_-Mf§ extends Sprite
   {
      
      private static var _instance:§_-Mf§;
      
      private static var §_-Yt§:Array = [];
      
      private static var §_-o2q§:Array = [0,10,20,30];
      
      private static var §_-p1k§:Array = [];
      
      private static var §_-i1b§:Array = [];
      
      private static const §_-r1A§:Array = [0,15,25];
      
      private static const §_-02z§:Array = [];
      
      private static var §_-o2e§:Array = [0,5,10,20,30,40,50,60,70,80,90];
      
      private var field:§_-i5§ = new §_-i5§("FPS: 0",0,0,new TextFormat(§_-i5§.§_-c10§,14,0));
      
      private var §_-H1m§:int = 0;
      
      private var §_-G2W§:Shape = new Shape();
      
      private var graphSprite2:Shape = new Shape();
      
      private var §_-23s§:int = 0;
      
      private var §_-Q1T§:int = 0;
      
      private var §_-u1q§:Boolean = false;
      
      private var §_-Qs§:Array = null;
      
      private var §_-m2T§:Object = {};
      
      public function §_-Mf§()
      {
         super();
         _instance = this;
         this.y = 200;
         addChild(this.graphSprite2);
         addChild(this.§_-G2W§);
         addChild(this.field);
         this.§_-5M§();
         addEventListener(MouseEvent.MOUSE_UP,this.§_-iW§);
         addEventListener(MouseEvent.MOUSE_DOWN,this.§_-a2h§);
         Game.§_-q1L§.addChild(this);
         this.visible = false;
         Game.stage.addEventListener(Event.ENTER_FRAME,this.§_-A1X§);
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-73S§);
         try
         {
            ExternalInterface.call("eval","var obj = swfobject.getObjectById(\"flash-app\");obj.addEventListener(\'focus\', function(e){obj.hasFocus(true);},false);obj.addEventListener(\'blur\', function(e){obj.hasFocus(false);},false);");
            ExternalInterface.addCallback("hasFocus",this.hasFocus);
         }
         catch(e:Error)
         {
         }
      }
      
      private static function §_-Kz§(param1:Array) : Number
      {
         var _loc2_:Number = 0;
         var _loc3_:int = 0;
         var _loc4_:int = int(param1.length);
         while(_loc3_ < _loc4_)
         {
            _loc2_ += Number(param1[_loc3_]);
            _loc3_++;
         }
         return _loc2_;
      }
      
      private static function §_-Q2Z§(param1:Array) : Number
      {
         var _loc2_:Number = 0;
         var _loc3_:int = 0;
         var _loc4_:int = int(param1.length);
         while(_loc3_ < _loc4_)
         {
            _loc2_ += Number(param1[_loc3_]) * _loc3_;
            _loc3_++;
         }
         return _loc2_;
      }
      
      private static function §_-z1Q§(param1:Number) : int
      {
         var _loc5_:int = 0;
         var _loc2_:Number = 1000 / param1;
         var _loc3_:int = 0;
         var _loc4_:* = int(§_-o2q§.length - 1);
         while(_loc4_ >= 0)
         {
            _loc5_ = int(§_-o2q§[_loc4_]);
            if(_loc5_ <= _loc2_)
            {
               _loc3_ = _loc4_;
               break;
            }
            _loc4_--;
         }
         return _loc3_;
      }
      
      private static function §_-bB§(param1:Number) : int
      {
         var _loc4_:int = 0;
         param1 *= 100;
         var _loc2_:int = 0;
         var _loc3_:* = int(§_-o2e§.length - 1);
         while(_loc3_ >= 0)
         {
            _loc4_ = int(§_-o2e§[_loc3_]);
            if(_loc4_ <= param1)
            {
               _loc2_ = _loc4_;
               break;
            }
            _loc3_--;
         }
         return _loc2_;
      }
      
      public static function §_-1O§() : void
      {
         §_-H22§();
      }
      
      private static function §_-H22§() : void
      {
         var normalized:Array;
         var avg:Number;
         var rounded_avg:int;
         var bad_percent:int;
         var sum:Number = NaN;
         sum = §_-Kz§(§_-Yt§);
         if(sum == 0)
         {
            return;
         }
         normalized = §_-Yt§.map(function(param1:*, param2:int, param3:Array):Number
         {
            if(Boolean(param2) || Boolean(param3))
            {
            }
            return Number(param1) / sum;
         });
         avg = §_-Q2Z§(normalized);
         rounded_avg = Math.round(avg);
         bad_percent = §_-bB§(normalized[0]);
         if(§_-p1k§.indexOf(rounded_avg) == -1)
         {
            §_-p1k§.push(rounded_avg);
            Analytics.§_-M2j§(rounded_avg);
         }
         if(§_-i1b§.indexOf(bad_percent) == -1)
         {
            §_-i1b§.push(bad_percent);
            Analytics.§_-fQ§(bad_percent);
         }
      }
      
      public static function §_-k1B§(param1:int) : void
      {
         var _loc2_:int = getTimer() / 1000 * 100 % §_-Zy§.§_-21V§;
         _instance.graphSprite2.graphics.lineStyle(1,param1);
         _instance.graphSprite2.graphics.drawRect(_loc2_,0,0,50);
      }
      
      public static function get count() : int
      {
         return _instance.§_-Q1T§;
      }
      
      public static function §_-81y§() : void
      {
         §_-Yt§ = [0,0,0,0];
         _instance.§_-Qs§ = new Array(§_-r1A§.length);
         var _loc1_:int = 0;
         while(_loc1_ < §_-r1A§.length)
         {
            _instance.§_-Qs§[_loc1_] = 0;
            _loc1_++;
         }
      }
      
      public static function §_-Mm§(param1:int) : void
      {
         var _loc5_:uint = 0;
         var _loc6_:Number = NaN;
         if(!_instance.§_-Qs§)
         {
            return;
         }
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         while(_loc4_ < §_-r1A§.length)
         {
            if(_loc2_ < _instance.§_-Qs§[_loc4_])
            {
               _loc2_ = int(_instance.§_-Qs§[_loc4_]);
               _loc3_ = _loc4_;
            }
            _loc4_++;
         }
         if(_loc2_ != 0)
         {
            if(§_-02z§.indexOf(param1) != -1)
            {
               _loc6_ = param1 << 8;
               _loc6_ = (_loc6_ | §_-u24§.location) << 8;
               _loc6_ |= _loc3_;
               Connection.§_-e2T§(§_-u1O§.§_-Ea§,§_-u1O§.§_-Ih§,_loc6_);
            }
            _loc5_ = uint(§_-u24§.location << 8);
            _loc5_ |= _loc3_;
            Connection.§_-e2T§(§_-u1O§.§_-Ea§,§_-u1O§.§_-93A§,_loc3_);
            Connection.§_-e2T§(§_-u1O§.§_-Ea§,§_-u1O§.§_-DE§,_loc5_);
            if(!(_loc3_ in _instance.§_-m2T§))
            {
               _instance.§_-m2T§[_loc3_] = 1;
               Analytics.§_-G18§(_loc3_);
            }
         }
         _instance.§_-Qs§ = null;
      }
      
      public static function §_-62S§(param1:Number) : void
      {
         var _loc2_:Number = §_-z1Q§(param1 * 1000);
         §_-Yt§[_loc2_] += param1;
      }
      
      private function hasFocus(param1:Boolean) : void
      {
         this.§_-u1q§ = param1;
      }
      
      private function §_-A1X§(param1:Event) : void
      {
         this.§_-G2W§.graphics.lineStyle(1,this.§_-u1q§ ? uint(16711680) : uint(12632256));
         var _loc2_:int = getTimer();
         this.update(_loc2_ - this.§_-H1m§);
         this.§_-H1m§ = _loc2_;
         if(!this.visible)
         {
            return;
         }
         Game.§_-q1L§.addChild(this);
      }
      
      private function update(param1:int) : void
      {
         var _loc2_:int = 1000 / param1;
         if(this.visible)
         {
            this.field.text = "FPS: " + _loc2_ + " Time:" + param1;
         }
         var _loc3_:int = this.§_-H1m§ / 1000 * 100;
         if(_loc3_ > §_-Zy§.§_-21V§ * (this.§_-23s§ + 1))
         {
            this.§_-5M§();
            ++this.§_-23s§;
         }
         this.§_-G2W§.graphics.lineTo(_loc3_ % §_-Zy§.§_-21V§,-((_loc2_ + this.§_-Q1T§) * 0.5) + 50);
         this.§_-Q1T§ = _loc2_;
         this.§_-k2c§(_loc2_);
      }
      
      private function §_-5M§() : void
      {
         this.§_-G2W§.graphics.clear();
         this.graphSprite2.graphics.clear();
         this.§_-G2W§.graphics.beginFill(12632256,0.5);
         this.§_-G2W§.graphics.drawRect(0,0,§_-Zy§.§_-21V§,50);
         this.§_-G2W§.graphics.endFill();
         this.§_-G2W§.graphics.lineStyle(1,16711680);
         this.§_-G2W§.graphics.moveTo(0,50);
      }
      
      private function §_-iW§(param1:Event) : void
      {
         this.stopDrag();
      }
      
      private function §_-a2h§(param1:Event) : void
      {
         this.startDrag(false,new Rectangle(0,0,0,690));
      }
      
      private function §_-73S§(param1:KeyboardEvent) : void
      {
         var e:KeyboardEvent = param1;
         if(e.keyCode != Keyboard.G || !e.ctrlKey)
         {
            return;
         }
         this.visible = !this.visible;
         try
         {
            Game.starling.§_-yL§ = !Game.starling.§_-yL§;
            if(Game.starling.§_-yL§ && false)
            {
               Game.starling.showStatsAt(§_-U2x§.LEFT,§_-42b§.CENTER);
            }
         }
         catch(e:Error)
         {
            §_-p2U§.add("starling showStats error: ");
         }
      }
      
      private function §_-k2c§(param1:int) : void
      {
         if(!this.§_-Qs§ || !this.§_-u1q§)
         {
            return;
         }
         var _loc2_:int = 0;
         while(_loc2_ < §_-r1A§.length)
         {
            if(_loc2_ == §_-r1A§.length - 1 || param1 < §_-r1A§[_loc2_ + 1])
            {
               ++this.§_-Qs§[_loc2_];
               break;
            }
            _loc2_++;
         }
      }
   }
}

