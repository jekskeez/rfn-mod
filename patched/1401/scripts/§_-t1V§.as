package
{
   import §_-T2y§.§_-92z§;
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
   import protocol.§_-h2B§;
   import starling.utils.§_-G8§;
   import starling.utils.§_-Y1C§;
   
   public class §_-t1V§ extends Sprite
   {
      
      private static var _instance:§_-t1V§;
      
      private static var §_-ed§:Array = [];
      
      private static var §_-r2K§:Array = [0,10,20,30];
      
      private static var §_-72P§:Array = [];
      
      private static var §_-PM§:Array = [];
      
      private static const §_-11I§:Array = [0,15,25];
      
      private static const §_-Yc§:Array = [];
      
      private static var §_-aV§:Array = [0,5,10,20,30,40,50,60,70,80,90];
      
      private var field:§_-22V§ = new §_-22V§("FPS: 0",0,0,new TextFormat(§_-22V§.§_-F2z§,14,0));
      
      private var §_-rg§:int = 0;
      
      private var §_-I2l§:Shape = new Shape();
      
      private var graphSprite2:Shape = new Shape();
      
      private var §_-D2R§:int = 0;
      
      private var §_-i2§:int = 0;
      
      private var §_-u4§:Boolean = false;
      
      private var §_-g2Q§:Array = null;
      
      private var §_-M2E§:Object = {};
      
      public function §_-t1V§()
      {
         super();
         _instance = this;
         this.y = 200;
         addChild(this.graphSprite2);
         addChild(this.§_-I2l§);
         addChild(this.field);
         this.§_-K1C§();
         addEventListener(MouseEvent.MOUSE_UP,this.§_-K25§);
         addEventListener(MouseEvent.MOUSE_DOWN,this.§_-S2F§);
         Game.§_-d2t§.addChild(this);
         this.visible = false;
         Game.stage.addEventListener(Event.ENTER_FRAME,this.§_-L1Y§);
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-O2u§);
         try
         {
            ExternalInterface.call("eval","var obj = swfobject.getObjectById(\"flash-app\");obj.addEventListener(\'focus\', function(e){obj.hasFocus(true);},false);obj.addEventListener(\'blur\', function(e){obj.hasFocus(false);},false);");
            ExternalInterface.addCallback("hasFocus",this.hasFocus);
         }
         catch(e:Error)
         {
         }
      }
      
      private static function §_-qh§(param1:Array) : Number
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
      
      private static function §_-HB§(param1:Array) : Number
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
      
      private static function §_-12M§(param1:Number) : int
      {
         var _loc5_:int = 0;
         var _loc2_:Number = 1000 / param1;
         var _loc3_:int = 0;
         var _loc4_:* = int(§_-r2K§.length - 1);
         while(_loc4_ >= 0)
         {
            _loc5_ = int(§_-r2K§[_loc4_]);
            if(_loc5_ <= _loc2_)
            {
               _loc3_ = _loc4_;
               break;
            }
            _loc4_--;
         }
         return _loc3_;
      }
      
      private static function §_-H25§(param1:Number) : int
      {
         var _loc4_:int = 0;
         param1 *= 100;
         var _loc2_:int = 0;
         var _loc3_:* = int(§_-aV§.length - 1);
         while(_loc3_ >= 0)
         {
            _loc4_ = int(§_-aV§[_loc3_]);
            if(_loc4_ <= param1)
            {
               _loc2_ = _loc4_;
               break;
            }
            _loc3_--;
         }
         return _loc2_;
      }
      
      public static function §_-13f§() : void
      {
         §_-zM§();
      }
      
      private static function §_-zM§() : void
      {
         var normalized:Array;
         var avg:Number;
         var rounded_avg:int;
         var bad_percent:int;
         var sum:Number = NaN;
         sum = §_-qh§(§_-ed§);
         if(sum == 0)
         {
            return;
         }
         normalized = §_-ed§.map(function(param1:*, param2:int, param3:Array):Number
         {
            if(Boolean(param2) || Boolean(param3))
            {
            }
            return Number(param1) / sum;
         });
         avg = §_-HB§(normalized);
         rounded_avg = Math.round(avg);
         bad_percent = §_-H25§(normalized[0]);
         if(§_-72P§.indexOf(rounded_avg) == -1)
         {
            §_-72P§.push(rounded_avg);
            Analytics.§_-Tg§(rounded_avg);
         }
         if(§_-PM§.indexOf(bad_percent) == -1)
         {
            §_-PM§.push(bad_percent);
            Analytics.§_-iv§(bad_percent);
         }
      }
      
      public static function §_-p2C§(param1:int) : void
      {
         var _loc2_:int = getTimer() / 1000 * 100 % §_-a9§.§_-9o§;
         _instance.graphSprite2.graphics.lineStyle(1,param1);
         _instance.graphSprite2.graphics.drawRect(_loc2_,0,0,50);
      }
      
      public static function get count() : int
      {
         return _instance.§_-i2§;
      }
      
      public static function §_-eq§() : void
      {
         §_-ed§ = [0,0,0,0];
         _instance.§_-g2Q§ = new Array(§_-11I§.length);
         var _loc1_:int = 0;
         while(_loc1_ < §_-11I§.length)
         {
            _instance.§_-g2Q§[_loc1_] = 0;
            _loc1_++;
         }
      }
      
      public static function §_-z1W§(param1:int) : void
      {
         var _loc5_:uint = 0;
         var _loc6_:Number = NaN;
         if(!_instance.§_-g2Q§)
         {
            return;
         }
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         while(_loc4_ < §_-11I§.length)
         {
            if(_loc2_ < _instance.§_-g2Q§[_loc4_])
            {
               _loc2_ = int(_instance.§_-g2Q§[_loc4_]);
               _loc3_ = _loc4_;
            }
            _loc4_++;
         }
         if(_loc2_ != 0)
         {
            if(§_-Yc§.indexOf(param1) != -1)
            {
               _loc6_ = param1 << 8;
               _loc6_ = (_loc6_ | §_-92z§.location) << 8;
               _loc6_ |= _loc3_;
               Connection.§_-Li§(§_-h2B§.§_-U1o§,§_-h2B§.§_-32T§,_loc6_);
            }
            _loc5_ = uint(§_-92z§.location << 8);
            _loc5_ |= _loc3_;
            Connection.§_-Li§(§_-h2B§.§_-U1o§,§_-h2B§.§_-z26§,_loc3_);
            Connection.§_-Li§(§_-h2B§.§_-U1o§,§_-h2B§.§_-83a§,_loc5_);
            if(!(_loc3_ in _instance.§_-M2E§))
            {
               _instance.§_-M2E§[_loc3_] = 1;
               Analytics.§_-u2D§(_loc3_);
            }
         }
         _instance.§_-g2Q§ = null;
      }
      
      public static function §_-Jz§(param1:Number) : void
      {
         var _loc2_:Number = §_-12M§(param1 * 1000);
         §_-ed§[_loc2_] += param1;
      }
      
      private function hasFocus(param1:Boolean) : void
      {
         this.§_-u4§ = param1;
      }
      
      private function §_-L1Y§(param1:Event) : void
      {
         this.§_-I2l§.graphics.lineStyle(1,this.§_-u4§ ? uint(16711680) : uint(12632256));
         var _loc2_:int = getTimer();
         this.update(_loc2_ - this.§_-rg§);
         this.§_-rg§ = _loc2_;
         if(!this.visible)
         {
            return;
         }
         Game.§_-d2t§.addChild(this);
      }
      
      private function update(param1:int) : void
      {
         var _loc2_:int = 1000 / param1;
         if(this.visible)
         {
            this.field.text = "FPS: " + _loc2_ + " Time:" + param1;
         }
         var _loc3_:int = this.§_-rg§ / 1000 * 100;
         if(_loc3_ > §_-a9§.§_-9o§ * (this.§_-D2R§ + 1))
         {
            this.§_-K1C§();
            ++this.§_-D2R§;
         }
         this.§_-I2l§.graphics.lineTo(_loc3_ % §_-a9§.§_-9o§,-((_loc2_ + this.§_-i2§) * 0.5) + 50);
         this.§_-i2§ = _loc2_;
         this.§_-G7§(_loc2_);
      }
      
      private function §_-K1C§() : void
      {
         this.§_-I2l§.graphics.clear();
         this.graphSprite2.graphics.clear();
         this.§_-I2l§.graphics.beginFill(12632256,0.5);
         this.§_-I2l§.graphics.drawRect(0,0,§_-a9§.§_-9o§,50);
         this.§_-I2l§.graphics.endFill();
         this.§_-I2l§.graphics.lineStyle(1,16711680);
         this.§_-I2l§.graphics.moveTo(0,50);
      }
      
      private function §_-K25§(param1:Event) : void
      {
         this.stopDrag();
      }
      
      private function §_-S2F§(param1:Event) : void
      {
         this.startDrag(false,new Rectangle(0,0,0,690));
      }
      
      private function §_-O2u§(param1:KeyboardEvent) : void
      {
         var e:KeyboardEvent = param1;
         if(e.keyCode != Keyboard.G || !e.ctrlKey)
         {
            return;
         }
         this.visible = !this.visible;
         try
         {
            Game.starling.§_-NM§ = !Game.starling.§_-NM§;
            if(Game.starling.§_-NM§ && false)
            {
               Game.starling.showStatsAt(§_-G8§.LEFT,§_-Y1C§.CENTER);
            }
         }
         catch(e:Error)
         {
            §_-TQ§.add("starling showStats error: ");
         }
      }
      
      private function §_-G7§(param1:int) : void
      {
         if(!this.§_-g2Q§ || !this.§_-u4§)
         {
            return;
         }
         var _loc2_:int = 0;
         while(_loc2_ < §_-11I§.length)
         {
            if(_loc2_ == §_-11I§.length - 1 || param1 < §_-11I§[_loc2_ + 1])
            {
               ++this.§_-g2Q§[_loc2_];
               break;
            }
            _loc2_++;
         }
      }
   }
}

