package §_-Rj§
{
   import §_-8I§.CastEvent;
   import §_-F1E§.§_-P1i§;
   import §_-Q1P§.§_-51h§;
   import §_-Q1P§.§_-UC§;
   import §_-Q1P§.§_-V10§;
   import §_-Q1P§.§_-y2d§;
   import §_-Q1P§.§_-zW§;
   import §_-RI§.§_-h2I§;
   import §_-S1D§.§_-C1G§;
   import §_-S1D§.§_-O1M§;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-P1Y§;
   import §_-e2w§.§_-52p§;
   import §_-e2w§.§_-I2t§;
   import §_-k1c§.§_-Q13§;
   import com.api.Player;
   import com.api.PlayerEvent;
   import events.EditorEvent;
   import events.GameEvent;
   import events.§_-55§;
   import events.§_-63A§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.net.FileReference;
   import flash.ui.Keyboard;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   import flash.utils.getQualifiedClassName;
   import game.mainGame.Cast;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-j2x§;
   import game.mainGame.entity.§_-03s§;
   import game.mainGame.entity.§_-63Q§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import tape.§_-5r§;
   import tape.§_-gH§;
   import utils.§_-c10§;
   import utils.§_-x1Z§;
   
   public class §_-A32§ extends SquirrelGame
   {
      
      private static const §_-ni§:int = 180;
      
      public var §_-bD§:§_-C1G§ = §_-C1G§.instance;
      
      public var §_-OO§:§_-UC§ = new §_-UC§();
      
      public var §_-v1P§:§_-y2d§ = §_-y2d§.instance;
      
      public var §_-uo§:Boolean = false;
      
      public var §_-ST§:§_-g1L§ = new §_-g1L§();
      
      public var §_-Sv§:§_-zW§ = null;
      
      public var header:§_-I2t§ = §_-I2t§.instance;
      
      public var §_-i1r§:Sprite = new Sprite();
      
      public var §_-o1W§:§_-91j§;
      
      public var history:§_-w1X§ = new §_-w1X§(this.map);
      
      public var §_-US§:§_-y1z§;
      
      private var §_-HH§:String = "";
      
      private var §_-s2o§:Boolean = false;
      
      private var §_-73Y§:Boolean = false;
      
      private var §_-M27§:Boolean = false;
      
      private var myFileReference:FileReference = new FileReference();
      
      private var §_-T1g§:FileReference = new FileReference();
      
      private var §_-9I§:§_-51h§ = null;
      
      private var §_-GL§:§_-g1L§ = new §_-g1L§();
      
      private var §_-m§:§_-g1L§ = new §_-g1L§();
      
      private var timer:Timer = new Timer(1000);
      
      private var §_-k20§:String = "";
      
      private var §_-Tq§:Number = 1;
      
      private var §_-429§:int = 0;
      
      private var §_-N1f§:int = 0;
      
      private var §_-d2b§:Boolean = false;
      
      private var §_-M2m§:§_-C2q§;
      
      public function §_-A32§()
      {
         this.map = new (§_-Nk§.mapClass(this.§_-429§,this.§_-N1f§))(this);
         this.squirrels = new (§_-Nk§.collectionClass(this.§_-429§,this.§_-N1f§))();
         this.header.§_-ap§ = this.map as §_-K15§;
         this.§_-s2Y§ = this.header;
         this.map.addEventListener(MouseEvent.CLICK,this.§_-P2v§,false,0,true);
         this.§_-Sv§ = new §_-zW§(this);
         if(§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-C2Y§))
         {
            this.§_-9I§ = new §_-51h§(this.map as §_-K15§);
         }
         this.§_-US§ = new §_-y1z§(this.§_-i2v§,this.§_-N1T§,this.§_-j2b§,this.§_-X2R§,this.exit,this.§_-7C§);
         this.§_-A1p§();
         super();
         addChild(this.§_-i1r§);
         this.§_-o1W§ = new §_-91j§(this);
         this.§_-o1W§.x = 1;
         this.§_-o1W§.y = 29;
         addChild(this.§_-o1W§);
         this.§_-M2m§ = new §_-C2q§(this);
         addChild(this.§_-M2m§);
         this.listen(true);
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-O2u§,false,0,true);
      }
      
      override public function dispose() : void
      {
         this.listen(false);
         Game.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-O2u§);
         if(this.squirrels)
         {
            (this.squirrels as §_-W28§).§_-z2l§();
         }
         this.map.removeEventListener(MouseEvent.CLICK,this.§_-P2v§);
         if(this.§_-o1W§)
         {
            this.§_-o1W§.dispose();
            this.§_-o1W§ = null;
         }
         if(this.§_-M2m§)
         {
            this.§_-M2m§.dispose();
            this.§_-M2m§ = null;
         }
         super.dispose();
         this.§_-GL§ = null;
         this.§_-m§ = null;
         this.§_-US§.dispose();
         this.§_-Sv§.dispose();
      }
      
      override public function set shift(param1:Point) : void
      {
         super.shift = param1;
         if(this.§_-uo§)
         {
            return;
         }
         this.§_-i1r§.graphics.clear();
         this.§_-i1r§.graphics.lineStyle(2,49427);
         var _loc2_:int = 1;
         var _loc3_:Number = this.map.size.x * (this.map as §_-K15§).scale;
         var _loc4_:Number = this.map.size.y * (this.map as §_-K15§).scale;
         var _loc5_:int = 0;
         if(param1.x < Game.starling.stage.stageWidth && param1.x >= 0)
         {
            _loc2_ = 1;
            while(_loc2_ <= int((Game.starling.stage.stageWidth - param1.x) / _loc3_))
            {
               this.§_-i1r§.graphics.moveTo(param1.x + _loc3_ * _loc2_,0);
               this.§_-i1r§.graphics.lineTo(param1.x + _loc3_ * _loc2_,Game.starling.stage.stageHeight);
               _loc2_++;
            }
         }
         else
         {
            _loc5_ = param1.x >= 0 ? int(int((param1.x - Game.starling.stage.stageWidth) / _loc3_) + 1) : int(Math.abs(int(param1.x / _loc3_)) + 1);
         }
         var _loc6_:int = param1.x >= 0 ? int(int(param1.x / _loc3_) + 1) : int(int((Math.abs(param1.x) + Game.starling.stage.stageWidth) / _loc3_) + 1);
         _loc2_ = _loc5_;
         while(_loc2_ < _loc6_)
         {
            this.§_-i1r§.graphics.moveTo(param1.x + (param1.x >= 0 ? -1 : 1) * (_loc3_ * _loc2_),0);
            this.§_-i1r§.graphics.lineTo(param1.x + (param1.x >= 0 ? -1 : 1) * (_loc3_ * _loc2_),Game.starling.stage.stageHeight);
            _loc2_++;
         }
         if(param1.y < Game.starling.stage.stageHeight && param1.y >= 0)
         {
            _loc2_ = 1;
            while(_loc2_ <= int((Game.starling.stage.stageHeight - param1.y) / _loc4_))
            {
               this.§_-i1r§.graphics.moveTo(0,param1.y + _loc4_ * _loc2_);
               this.§_-i1r§.graphics.lineTo(Game.starling.stage.stageWidth,param1.y + _loc4_ * _loc2_);
               _loc2_++;
            }
            _loc5_ = 0;
         }
         else
         {
            _loc5_ = param1.y >= 0 ? int(int((param1.y - Game.starling.stage.stageHeight) / _loc4_) + 1) : int(Math.abs(int(param1.y / _loc4_)) + 1);
         }
         _loc6_ = param1.y >= 0 ? int(int(param1.y / _loc4_) + 1) : int(int((Math.abs(param1.y) + Game.starling.stage.stageHeight) / _loc4_) + 1);
         _loc2_ = _loc5_;
         while(_loc2_ < _loc6_)
         {
            this.§_-i1r§.graphics.moveTo(0,param1.y + (param1.y >= 0 ? -1 : 1) * (_loc4_ * _loc2_));
            this.§_-i1r§.graphics.lineTo(Game.starling.stage.stageWidth,param1.y + (param1.y >= 0 ? -1 : 1) * (_loc4_ * _loc2_));
            _loc2_++;
         }
         if(Boolean(this.§_-o1W§) && this.§_-o1W§.visible)
         {
            this.§_-o1W§.update();
         }
      }
      
      public function get §_-r1L§() : int
      {
         return this.§_-GL§.number;
      }
      
      public function get location() : int
      {
         return this.§_-GL§.location;
      }
      
      public function get §_-j1P§() : Boolean
      {
         return this.§_-uo§;
      }
      
      public function get §_-02I§() : int
      {
         return this.§_-ST§.location;
      }
      
      public function get §_-Z1G§() : int
      {
         return this.§_-ST§.mode;
      }
      
      public function get scale() : Number
      {
         return this.§_-Tq§;
      }
      
      public function set scale(param1:Number) : void
      {
         if(this.§_-uo§)
         {
            return;
         }
         if(this.§_-Tq§ == param1)
         {
            return;
         }
         if(param1 > §_-C2q§.§_-c1K§ || param1 < §_-C2q§.§_-H13§)
         {
            return;
         }
         this.§_-Tq§ = param1;
         this.§_-Tk§(param1);
         this.shift = this.§_-X2D§();
         (this.map as §_-K15§).§_-K1n§.clear();
         (this.map as §_-K15§).§_-G2F§(this.§_-bD§.§_-V1R§);
         this.header.§_-d1h§(this.§_-Tq§);
      }
      
      public function §_-q1u§() : void
      {
         this.§_-829§(false);
         this.reset();
         this.§_-OO§.show();
         this.§_-s2o§ = false;
      }
      
      public function §_-Ao§(param1:int, param2:int, param3:int, param4:int) : void
      {
         this.reset();
         this.header.§_-G22§ = true;
         this.§_-v1P§.§_-G22§ = true;
         this.§_-ST§.reset();
         this.§_-73Y§ = false;
         this.map.clear();
         this.§_-35§();
         this.header.§_-d1h§(this.§_-Tq§);
         this.header.§_-G22§ = true;
         this.§_-v1P§.hide();
         this.§_-v1P§.§_-G22§ = true;
         this.§_-v1P§.silent = true;
         this.§_-v1P§.§_-Mp§();
         this.§_-bD§.§_-Ao§(param1);
         this.header.§_-Ao§(param1);
         this.§_-v1P§.§_-X1t§.§_-p1A§(param3);
         this.§_-v1P§.§_-m2w§();
         this.§_-v1P§.§_-R2K§.§_-p1A§(param1);
         this.§_-v1P§.§_-o2h§(null);
         this.§_-v1P§.silent = false;
         this.§_-GL§.number = param2;
         this.§_-GL§.location = param1;
         this.§_-GL§.§_-H26§ = param4;
         this.§_-Fe§(null);
         var _loc5_:Boolean = §_-Wl§.last == param2 && !§_-Wl§.isEmpty;
         var _loc6_:Boolean = §_-Wl§.first == param2 && !§_-Wl§.isEmpty;
         this.header.§_-g8§.enabled = this.header.§_-g8§.mouseEnabled = !_loc5_;
         this.header.§_-g8§.filters = _loc5_ ? §_-x1Z§.§_-c2G§ : [];
         this.header.§_-y1t§.enabled = this.header.§_-y1t§.mouseEnabled = !_loc6_;
         this.header.§_-y1t§.filters = _loc6_ ? §_-x1Z§.§_-c2G§ : [];
         Connection.§_-Li§(§_-h2B§.§_-V2T§,param2);
         this.§_-s2o§ = false;
      }
      
      public function §_-m1Q§(param1:int = 0, param2:int = 0, param3:int = 0) : void
      {
         this.reset();
         this.§_-GL§.reset();
         this.§_-v1P§.§_-Q1T§();
         this.§_-35§();
         this.§_-bD§.§_-m1Q§();
         this.header.§_-m1Q§();
         this.§_-s2o§ = false;
         this.§_-o1W§.§_-I6§();
         this.header.§_-G22§ = false;
         this.§_-v1P§.§_-G22§ = false;
         this.§_-v1P§.§_-Mp§();
         this.§_-ST§.reset();
         this.§_-73Y§ = true;
         this.§_-Fe§(null);
         this.§_-v1P§.§_-X1C§(§_-ni§);
         this.§_-v1P§.rating(0,0,0,0,0);
         this.header.§_-uu§.text = "";
         this.§_-v1P§.silent = true;
         this.§_-v1P§.§_-R2K§.§_-p1A§(param1);
         this.§_-v1P§.§_-o2h§(null);
         this.§_-v1P§.mode = param2;
         this.§_-v1P§.sub = param3;
         this.§_-v1P§.silent = false;
         this.§_-v1P§.show();
         (this.map as §_-K15§).§_-G2F§(this.§_-bD§.§_-V1R§);
         this.§_-Na§();
         if(§_-P1Y§.instance)
         {
            §_-P1Y§.instance.§_-M2Y§(param1,param2);
         }
      }
      
      public function §_-Wo§() : void
      {
         this.§_-US§.§_-53x§();
      }
      
      public function reset(param1:Boolean = true) : void
      {
         if(this.§_-o1W§)
         {
            this.§_-o1W§.hide();
         }
         if(this.squirrels)
         {
            (this.squirrels as §_-W28§).§_-z2l§();
         }
         (this.map as §_-K15§).§_-z2l§();
         this.§_-uo§ = false;
         this.§_-bD§.reset();
         this.timer.stop();
         §_-52p§.clear();
         if(this.§_-9I§)
         {
            this.§_-9I§.removeAll();
         }
         if(this.squirrels)
         {
            this.squirrels.clear();
         }
         if(this.map)
         {
            this.map.clear();
            (this.map as §_-K15§).enabled = true;
            this.map.visible = true;
         }
         if(param1)
         {
            this.shift = this.§_-X2D§();
         }
         §_-si§();
      }
      
      public function §_-Jt§(param1:Event) : void
      {
         var lengthIds:int = 0;
         var shamanObjectsIds:Array = null;
         var i:int = 0;
         var e:Event = param1;
         try
         {
            this.§_-T1g§.data.position = 0;
            this.§_-m§.map = this.§_-T1g§.data.readUTF();
            this.§_-m§.time = this.§_-T1g§.data.readInt();
            lengthIds = this.§_-T1g§.data.readInt();
            shamanObjectsIds = [];
            i = 0;
            while(i < lengthIds)
            {
               shamanObjectsIds.push(this.§_-T1g§.data.readInt());
               i++;
            }
            this.§_-o1W§.§_-I6§();
            this.§_-bD§.§_-mJ§(shamanObjectsIds);
            this.map.§_-41M§(this.§_-m§.map);
            this.§_-v1P§.§_-Q1T§();
            this.§_-v1P§.§_-X1C§(this.§_-m§.time);
            this.§_-v1P§.§_-P1j§();
            (this.map as §_-K15§).§_-K1n§.clear();
            this.§_-Fe§(null);
            this.shift = this.§_-X2D§();
            this.header.§_-32j§();
            this.history.clear();
            this.§_-35§();
         }
         catch(error:Error)
         {
            §_-TQ§.add("SquirrelGameEditor->onFileLoaded: " + error.message);
         }
      }
      
      public function §_-Wg§() : void
      {
         if(!this.history.§_-Wg§())
         {
            return;
         }
         this.header.§_-XO§(this.history.§_-kM§,this.history.§_-3z§);
         this.§_-M27§ = false;
      }
      
      public function §_-o2B§(param1:MouseEvent) : void
      {
         this.§_-v1P§.show();
      }
      
      public function §_-JM§(param1:MouseEvent) : void
      {
         if(this.§_-9I§)
         {
            this.§_-9I§.show();
         }
      }
      
      public function §_-V2z§(param1:MouseEvent = null) : void
      {
         this.§_-bD§.visible = true;
         if(this.§_-9I§)
         {
            this.§_-9I§.removeAll();
            this.§_-9I§.hide();
         }
         this.§_-Iu§();
         §_-O1M§.hide();
         §_-O1M§.hero = null;
         §_-O1M§.§_-L2u§(this.§_-S2Z§);
         this.reset(false);
         this.§_-uo§ = false;
         this.§_-j1L§ = false;
         this.§_-1q§ = false;
         this.§_-bD§.§_-E2m§(true);
         this.squirrels.clear();
         this.map.§_-41M§(this.§_-HH§);
         (this.map as §_-K15§).enabled = true;
         this.§_-Tk§(this.§_-Tq§);
         this.§_-i1r§.visible = true;
         this.shift = this.§_-X2D§();
         this.§_-Na§();
         this.header.§_-V2z§(null);
         this.header.§_-d1h§(this.§_-Tq§);
      }
      
      public function §_-731§(param1:MouseEvent = null) : void
      {
         this.§_-vU§();
         §_-P1Y§.§_-Vx§ = {};
         this.§_-S22§();
         (this.map as §_-K15§).§_-G2F§(this.§_-bD§.§_-V1R§);
         if(this.§_-uo§)
         {
            this.map.§_-41M§(this.§_-HH§);
         }
         else
         {
            this.§_-HH§ = this.map.§_-A1X§();
         }
         this.§_-vD§(this.§_-ST§,this.§_-HH§);
         (this.map as §_-K15§).enabled = false;
         this.§_-bD§.visible = false;
         if(this.cast)
         {
            this.cast.removeFromParent(true);
            this.cast.dispose();
         }
         this.cast = §_-V10§.§_-c0§.§_-o2Q§ || §_-V10§.§_-c0§.§_-A3w§ ? new §_-P1i§(this) : new Cast(this);
         §_-83v§(this.cast);
         this.§_-Tk§(1);
         this.§_-uo§ = true;
         this.§_-i1r§.visible = false;
         (this.map as §_-K15§).§_-w1B§();
         this.shift = this.§_-X2D§();
         §_-91L§();
         this.§_-1q§ = this.§_-Z1G§ == §_-q1p§.§_-cq§;
         (this.squirrels as §_-W28§).§_-Qa§(this.§_-Z1G§,this.§_-Sv§);
         this.§_-Sv§.§_-D2p§();
         this.§_-62k§();
         this.§_-j1L§ = true;
         §_-O1M§.§_-22R§ = true;
         §_-O1M§.show();
         §_-O1M§.§_-C6§(this.§_-S2Z§);
         §_-O1M§.§_-F2g§ = §_-S2I§.ROUND_START;
         this.§_-bD§.§_-E2m§(false);
         this.header.§_-42v§(this.§_-v1P§.minutes,this.§_-v1P§.seconds);
         this.timer.repeatCount = int(this.§_-v1P§.minutes) * 60 + int(this.§_-v1P§.seconds);
         this.timer.reset();
         this.timer.start();
         this.header.§_-731§();
      }
      
      public function §_-j1q§(param1:Event = null) : void
      {
         var _loc2_:Boolean = false;
         if(this.§_-uo§)
         {
            this.§_-V2z§();
         }
         else
         {
            this.header.§_-32j§();
            this.header.§_-V2z§(null);
         }
         (this.map as §_-K15§).§_-K1n§.clear();
         this.§_-vD§(this.§_-m§);
         this.history.clear();
         if(this.header.§_-G22§)
         {
            _loc2_ = !this.§_-m§.§_-a14§(this.§_-GL§);
         }
         else
         {
            _loc2_ = !this.map.isEmpty();
         }
         if(_loc2_ && !this.§_-M27§)
         {
            if(this.§_-v1P§.§_-A14§ == Game.selfId || §_-c10§.§_-73j§(Game.rights,§_-c10§.§_-C2Y§) || !this.header.§_-G22§)
            {
               this.§_-US§.§_-Ww§();
            }
            else
            {
               this.exit();
            }
            this.block();
            return;
         }
         this.exit();
      }
      
      public function §_-m1f§(param1:Event) : void
      {
         this.§_-M27§ = true;
         this.history.clear();
         this.§_-35§();
      }
      
      public function §_-7C§() : void
      {
         this.§_-HH§ = this.map.§_-A1X§();
         this.§_-829§(true);
         this.squirrels.clear();
         this.map.§_-41M§(this.§_-HH§);
         (this.map as §_-K15§).enabled = !this.§_-uo§;
         this.§_-j1L§ = this.§_-uo§;
         this.§_-bD§.§_-mJ§(this.map.§_-u1T§);
         (this.map as §_-K15§).§_-G2F§(this.§_-bD§.§_-V1R§);
         this.§_-bD§.§_-E2m§(true);
         if(this.§_-uo§)
         {
            this.§_-62k§();
         }
      }
      
      public function §_-M2Y§(param1:int, param2:int, param3:String = null) : void
      {
         var mapClass:Class;
         var collectionClass:Class;
         var oldMap:§_-K15§ = null;
         var oldSquirrels:* = undefined;
         var mapData:String = null;
         var shift:Point = null;
         var locationId:int = param1;
         var modeId:int = param2;
         var serializedMap:String = param3;
         if(this.§_-uo§ || this.§_-d2b§)
         {
            return;
         }
         mapClass = §_-Nk§.mapClass(locationId,modeId);
         collectionClass = §_-Nk§.collectionClass(locationId,modeId);
         if(getQualifiedClassName(this.map) == getQualifiedClassName(mapClass) && getQualifiedClassName(this.squirrels) == getQualifiedClassName(collectionClass))
         {
            this.§_-429§ = locationId;
            this.§_-N1f§ = modeId;
            if(serializedMap != null)
            {
               this.map.§_-41M§(serializedMap);
            }
            return;
         }
         this.§_-d2b§ = true;
         try
         {
            oldMap = this.map as §_-K15§;
            oldSquirrels = this.squirrels;
            mapData = serializedMap != null ? serializedMap : this.map.§_-A1X§();
            shift = this.shift;
            if(this.§_-9I§)
            {
               this.§_-9I§.§_-t9§(null);
            }
            this.§_-429§ = locationId;
            this.§_-N1f§ = modeId;
            this.map = new mapClass(this);
            this.squirrels = new collectionClass();
            this.§_-03N§(oldMap,oldSquirrels);
            this.§_-j1d§();
            this.history.§_-t9§(this.map);
            this.header.§_-ap§ = this.map as §_-K15§;
            if(this.§_-9I§)
            {
               this.§_-9I§.§_-t9§(this.map as §_-K15§);
            }
            this.map.§_-41M§(mapData);
            this.shift = shift;
         }
         finally
         {
            this.§_-d2b§ = false;
         }
      }
      
      public function §_-i2o§() : void
      {
         this.header.§_-ap§ = this.map as §_-K15§;
         this.§_-bD§.§_-nl§(this.map.§_-u1T§);
         (this.map as §_-K15§).§_-G2F§(this.§_-bD§.§_-V1R§);
         (this.map as §_-K15§).§_-g1Z§();
         if((this.map as §_-K15§).scale != this.§_-Tq§)
         {
            this.§_-Tk§(this.§_-Tq§);
         }
         this.header.§_-d1h§(this.§_-Tq§);
         §_-I2t§.show();
         §_-C1G§.show();
         this.§_-Sv§.§_-D2p§();
      }
      
      public function §_-P9§(param1:PlayerEvent) : void
      {
         if(this.§_-GL§.§_-i1v§ == -1 && this.map.§_-C2H§ == 0)
         {
            return;
         }
         var _loc2_:Player = param1.player;
         if(_loc2_.id == this.§_-GL§.§_-i1v§)
         {
            this.§_-v1P§.§_-A14§ = _loc2_.id;
         }
         if(_loc2_.id == this.map.§_-C2H§)
         {
            this.§_-v1P§.§_-l26§ = _loc2_.id;
         }
      }
      
      public function §_-o2C§(param1:§_-S2I§) : void
      {
         switch(param1.type)
         {
            case §_-S2I§.§_-pN§:
               if(this.§_-GL§.number != param1[0])
               {
                  return;
               }
               this.§_-GL§.load(param1.slice(1,param1.length));
               this.§_-HH§ = this.§_-GL§.map;
               this.§_-v1P§.§_-X1C§(this.§_-GL§.time);
               this.§_-v1P§.map = this.§_-GL§.number;
               this.§_-v1P§.silent = true;
               if(this.§_-GL§.location)
               {
                  this.§_-v1P§.§_-R2K§.§_-p1A§(this.§_-GL§.location);
                  this.§_-v1P§.§_-o2h§(null);
               }
               this.§_-v1P§.mode = this.§_-GL§.mode;
               this.§_-v1P§.sub = this.§_-GL§.§_-H26§;
               this.§_-v1P§.silent = false;
               this.§_-v1P§.rating(this.§_-GL§.§_-L2R§,this.§_-GL§.§_-B8§,this.§_-GL§.§_-jm§,this.§_-GL§.§_-t1m§,this.§_-GL§.§_-mr§);
               this.§_-v1P§.§_-P1j§();
               this.header.§_-uu§.htmlText = "<a href=\'event:#\'>" + String(this.§_-GL§.number) + "</a>";
               this.reset();
               this.§_-o1W§.§_-I6§();
               this.§_-uo§ = false;
               this.§_-j1L§ = false;
               if(§_-P1Y§.instance)
               {
                  §_-P1Y§.instance.§_-M2Y§(this.§_-v1P§.§_-Vz§,this.§_-v1P§.mode,this.§_-HH§);
               }
               else
               {
                  this.§_-M2Y§(this.§_-v1P§.§_-Vz§,this.§_-v1P§.mode,this.§_-HH§);
                  this.§_-Fe§(null);
                  this.§_-i2o§();
               }
               (this.map as §_-K15§).enabled = true;
               if(this.map.§_-C2H§ == 0)
               {
                  this.§_-v1P§.§_-l26§ = 0;
                  Game.request(this.§_-GL§.§_-i1v§,§_-hF§.§_-31q§);
               }
               else
               {
                  Game.request([this.§_-GL§.§_-i1v§,this.map.§_-C2H§],§_-hF§.§_-31q§);
               }
               this.§_-Na§();
               break;
            case §_-S2I§.§_-9G§:
               this.§_-GL§.number = param1[0];
               this.§_-GL§.§_-H26§ = param1[2];
               if(this.§_-GL§.number == 0)
               {
                  §_-TQ§.add("Error wrong number of map");
                  return;
               }
               §_-UC§.§_-j1d§(this.§_-GL§.number,this.§_-m§.location,this.§_-m§.mode,Game.selfId,this.§_-m§.§_-H26§);
               this.§_-v1P§.map = this.§_-GL§.number;
               this.header.§_-uu§.htmlText = "<a href=\'event:#\'>" + String(this.§_-GL§.number) + "</a>";
               this.§_-v1P§.§_-A14§ = Game.selfId;
         }
      }
      
      public function §_-i1c§(param1:Event) : void
      {
         new §_-Q13§(gls("ВНИМАНИЕ!"),gls("Соединение с сервером было разорвано.\nСохраните карту локально и перезапустите игру!")).show();
         this.header.connectionClosed = true;
         this.header.§_-Ga§();
      }
      
      public function §_-o1t§() : void
      {
         this.shift = this.§_-X2D§();
      }
      
      protected function §_-C1L§() : Boolean
      {
         var _loc1_:int = this.§_-v1P§.§_-Vz§;
         var _loc2_:int = this.§_-v1P§.mode;
         if(!(this.map as §_-K15§).§_-sr§(_loc1_,_loc2_))
         {
            return false;
         }
         var _loc3_:int = this.§_-A3n§();
         if(_loc3_ < Game.§_-KX§)
         {
            this.§_-US§.§_-11P§((this.map as §_-K15§).§_-u2E§(_loc1_,_loc2_));
            return false;
         }
         return true;
      }
      
      private function §_-03N§(param1:§_-K15§, param2:*) : void
      {
         if(!param1)
         {
            return;
         }
         param1.removeEventListener(MouseEvent.CLICK,this.§_-P2v§);
         if(param2)
         {
            (param2 as §_-W28§).§_-z2l§();
         }
         removeChildStarling(param1.§_-P2y§);
         if(param2)
         {
            removeChildStarling(param2);
         }
         if(Boolean(param2) && contains(param2))
         {
            removeChild(param2);
         }
         if(contains(param1))
         {
            removeChild(param1);
         }
         param1.dispose();
         if(param2)
         {
            param2.dispose();
         }
         if(this.§_-A3o§)
         {
            this.§_-A3o§.dispose();
            removeChildStarling(this.§_-A3o§);
            this.§_-A3o§ = null;
         }
      }
      
      private function §_-j1d§() : void
      {
         addChildAt(this.map,0);
         §_-83v§(this.squirrels);
         addChild(this.squirrels);
         §_-83v§(this.map.§_-P2y§);
         this.§_-A3o§ = new §_-j2x§(this.map);
         §_-83v§(this.§_-A3o§);
         this.map.addEventListener(MouseEvent.CLICK,this.§_-P2v§,false,0,true);
      }
      
      private function §_-Fe§(param1:GameEvent) : void
      {
         (this.map as §_-K15§).§_-g1Z§();
      }
      
      private function §_-J1F§(param1:MouseEvent) : void
      {
         this.§_-o1W§.toggle();
      }
      
      private function §_-MG§(param1:MouseEvent) : void
      {
         this.§_-M2m§.§_-q0§(-§_-C2q§.§_-Ym§);
      }
      
      private function §_-03I§(param1:MouseEvent) : void
      {
         this.§_-M2m§.§_-q0§(§_-C2q§.§_-Ym§);
      }
      
      private function §_-tr§(param1:MouseEvent) : void
      {
         §_-V10§.show(this);
      }
      
      private function §_-nF§(param1:MouseEvent) : void
      {
         this.shift = this.§_-X2D§();
         if(param1)
         {
            if(param1.currentTarget is ButtonNextMap)
            {
               this.§_-k20§ = "Next";
            }
            else if(param1.currentTarget is ButtonPrevMap)
            {
               this.§_-k20§ = "Prev";
            }
         }
         if(!§_-UC§.§_-1J§(this.§_-GL§.number,this.§_-k20§))
         {
            this.§_-k20§ = "";
            return;
         }
         this.§_-j1q§();
      }
      
      private function §_-02b§() : Boolean
      {
         if(this.§_-k20§ == "")
         {
            return false;
         }
         switch(this.§_-k20§)
         {
            case "Next":
               §_-UC§.§_-q1t§(this.§_-GL§.number);
               break;
            case "Prev":
               §_-UC§.§_-L1U§(this.§_-GL§.number);
         }
         this.§_-k20§ = "";
         return true;
      }
      
      private function §_-lY§(param1:MouseEvent) : void
      {
         if(!this.map)
         {
            return;
         }
         (this.map as §_-K15§).§_-K1n§.clear();
      }
      
      private function §_-P2v§(param1:MouseEvent) : void
      {
         this.§_-Na§();
      }
      
      private function §_-62k§() : void
      {
         var _loc1_:§_-W28§ = this.squirrels as §_-W28§;
         _loc1_.clear();
         var _loc2_:int = _loc1_.§_-NJ§();
         if(_loc2_ <= 0)
         {
            return;
         }
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_.add(-_loc3_ - 1);
            _loc3_++;
         }
         _loc1_.reset();
         _loc1_.§_-e1I§();
         _loc1_.place();
         _loc1_.show();
         _loc1_.next();
      }
      
      private function §_-vD§(param1:§_-g1L§, param2:String = null) : void
      {
         this.§_-v1P§.§_-91Q§();
         param1.time = this.§_-A3n§();
         param1.location = this.§_-v1P§.§_-Vz§;
         param1.mode = this.§_-v1P§.mode;
         param1.§_-H26§ = this.§_-v1P§.sub;
         param1.number = this.§_-GL§.number;
         param1.§_-i1v§ = this.§_-GL§.§_-i1v§;
         (this.map as §_-K15§).§_-G2F§(this.§_-bD§.§_-V1R§);
         if(this.§_-uo§)
         {
            param1.map = this.§_-ST§.map;
         }
         else
         {
            param1.map = param2 ? param2 : this.map.§_-A1X§();
            this.map.§_-C2H§ = Game.selfId;
         }
      }
      
      private function §_-A2u§(param1:Event = null) : void
      {
         this.§_-Sv§.§_-D2p§();
         this.§_-Fe§(null);
      }
      
      private function listen(param1:Boolean) : void
      {
         var _loc2_:String = null;
         var _loc3_:Array = null;
         var _loc4_:Object = null;
         this.§_-43y§(this.§_-Sv§,GameEvent.SWAP_BACKGROUND,this.§_-Fe§,param1);
         this.§_-43y§(this.§_-v1P§,EditorEvent.LOCATION_CHANGED,this.§_-A2u§,param1);
         this.§_-43y§(this.§_-v1P§,EditorEvent.MODE_CHANGED,this.§_-A2u§,param1);
         this.§_-43y§(this.§_-v1P§,EditorEvent.SUBLOCATION_CHANGED,this.§_-A2u§,param1);
         this.§_-43y§(this.§_-bD§,MouseEvent.CLICK,this.§_-lY§,param1,true);
         this.§_-c1L§(this.§_-bD§.§_-y0§,param1);
         this.§_-c1L§(this.§_-bD§.§_-P11§,param1);
         for(_loc2_ in this.§_-bD§.§_-u2k§)
         {
            this.§_-43y§(this.§_-bD§.§_-u2k§[_loc2_] as §_-5r§,§_-63A§.§_-NG§,this.§_-32u§,param1);
         }
         for(_loc2_ in this.§_-bD§.§_-A2w§)
         {
            this.§_-43y§(this.§_-bD§.§_-A2w§[_loc2_] as §_-gH§,§_-63A§.§_-NG§,this.§_-32u§,param1);
         }
         for(_loc2_ in this.§_-bD§.§_-U1H§)
         {
            this.§_-43y§(this.§_-bD§.§_-U1H§[_loc2_] as §_-gH§,§_-63A§.§_-NG§,this.§_-32u§,param1);
         }
         _loc3_ = [{
            "button":this.header.§_-O2R§,
            "handler":this.§_-731§
         },{
            "button":this.header.§_-V1u§,
            "handler":this.§_-V2z§
         },{
            "button":this.header.§_-g8§,
            "handler":this.§_-nF§
         },{
            "button":this.header.§_-y1t§,
            "handler":this.§_-nF§
         },{
            "button":this.header.§_-M2P§,
            "handler":this.§_-hz§
         },{
            "button":this.header.§_-n2C§,
            "handler":this.§_-s1v§
         },{
            "button":this.header.§_-gj§,
            "handler":this.§_-U11§
         },{
            "button":this.header.§_-43q§,
            "handler":this.§_-D1w§
         },{
            "button":this.header.§_-2W§,
            "handler":this.§_-D1w§
         },{
            "button":this.header.§_-za§,
            "handler":this.§_-V1T§
         },{
            "button":this.header.§_-X1w§,
            "handler":this.§_-12Q§
         },{
            "button":this.header.§_-R1t§,
            "handler":this.§_-J1F§
         },{
            "button":this.header.§_-oz§,
            "handler":this.§_-MG§
         },{
            "button":this.header.§_-n2J§,
            "handler":this.§_-03I§
         },{
            "button":this.header.§_-k2w§,
            "handler":this.§_-tr§
         },{
            "button":this.header.§_-j2w§,
            "handler":this.§_-o2B§
         },{
            "button":this.header.§_-G1N§,
            "handler":this.§_-B3z§
         },{
            "button":this.header.§_-a17§,
            "handler":this.§_-JM§
         },{
            "button":this.header.§_-U1B§,
            "handler":this.§_-j1q§
         }];
         for each(_loc4_ in _loc3_)
         {
            this.§_-43y§(_loc4_.button,MouseEvent.CLICK,_loc4_.handler,param1);
         }
      }
      
      private function §_-43y§(param1:EventDispatcher, param2:String, param3:Function, param4:Boolean, param5:Boolean = false) : void
      {
         if(param4)
         {
            param1.addEventListener(param2,param3,param5,0,true);
         }
         else
         {
            param1.removeEventListener(param2,param3,param5);
         }
      }
      
      private function §_-c1L§(param1:Array, param2:Boolean) : void
      {
         var _loc3_:EventDispatcher = null;
         for each(_loc3_ in param1)
         {
            this.§_-43y§(_loc3_,§_-63A§.§_-NG§,this.§_-32u§,param2);
         }
      }
      
      private function §_-S22§() : void
      {
         var _loc1_:DisplayObject = null;
         if(!this.map)
         {
            return;
         }
         for each(_loc1_ in this.map.get(§_-63Q§,true))
         {
            if(_loc1_)
            {
               _loc1_.x = Math.round(_loc1_.x);
               _loc1_.y = Math.round(_loc1_.y);
            }
         }
      }
      
      private function §_-B3z§(param1:MouseEvent) : void
      {
         this.§_-Sv§.show();
      }
      
      private function §_-O2u§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.E && param1.ctrlKey)
         {
            this.§_-Sv§.show();
         }
         if(param1.keyCode == Keyboard.M && param1.ctrlKey)
         {
            §_-TQ§.add("MAP trace:",this.map.§_-A1X§());
         }
         if(param1.keyCode == Keyboard.Q && param1.ctrlKey && param1.altKey && Boolean(this.§_-9I§))
         {
            this.§_-9I§.show();
         }
         if(param1.keyCode == Keyboard.B && param1.ctrlKey && !this.§_-uo§)
         {
            this.§_-Fe§(null);
         }
         if(param1.keyCode == Keyboard.R && param1.ctrlKey)
         {
            this.§_-o1W§.toggle();
         }
         if(Game.stage.focus != this.map && Game.stage.focus != this.§_-v1P§)
         {
            return;
         }
         switch(param1.keyCode)
         {
            case Keyboard.NUMPAD_ADD:
               if(Boolean(this.header.§_-j2w§.enabled) && !param1.ctrlKey)
               {
                  if(this.§_-v1P§.visible)
                  {
                     this.§_-v1P§.hide();
                  }
                  else
                  {
                     this.§_-v1P§.show();
                  }
               }
               break;
            case Keyboard.NUMPAD_4:
               if(this.header.§_-y1t§.enabled)
               {
                  this.§_-k20§ = "Prev";
                  this.§_-nF§(null);
               }
               break;
            case Keyboard.NUMPAD_6:
               if(this.header.§_-g8§.enabled)
               {
                  this.§_-k20§ = "Next";
                  this.§_-nF§(null);
               }
               break;
            case Keyboard.NUMPAD_DECIMAL:
               if(Boolean(this.header.§_-M2P§.enabled) && §_-c10§.§_-73j§(Game.rights,§_-c10§.§_-C2Y§))
               {
                  this.§_-hz§(null);
               }
               break;
            case Keyboard.ENTER:
               if(!this.§_-US§.§_-82x§ || !§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-C2Y§))
               {
                  return;
               }
               this.§_-i2v§();
               this.§_-US§.§_-D5§();
         }
      }
      
      private function §_-S2Z§(param1:§_-55§) : void
      {
         if(!this.§_-uo§)
         {
            return;
         }
         this.cast.§_-52I§(new CastEvent(CastEvent.SELECT,param1.className));
      }
      
      private function §_-32u§(param1:§_-63A§) : void
      {
         var _loc2_:int = §_-03s§.§_-X21§(param1.className);
         (this.map as §_-K15§).§_-x25§(_loc2_);
         this.§_-Na§();
         this.§_-Wg§();
      }
      
      private function §_-Na§() : void
      {
         Game.stage.focus = this.map;
      }
      
      private function block() : void
      {
         this.§_-829§(false);
         this.§_-j1L§ = false;
         (this.map as §_-K15§).enabled = false;
      }
      
      private function exit() : void
      {
         if(this.§_-02b§())
         {
            return;
         }
         this.§_-GL§.number = -1;
         if(!§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-C2Y§))
         {
            §_-71o§.show("Location");
            return;
         }
         this.squirrels.clear();
         this.map.clear();
         if(§_-UC§.§_-P21§())
         {
            §_-71o§.show("Location");
            return;
         }
         this.§_-q1u§();
      }
      
      private function §_-D1w§(param1:Event = null) : Boolean
      {
         this.§_-vD§(this.§_-m§);
         if(!§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-C2Y§) && !this.§_-ST§.§_-a14§(this.§_-m§))
         {
            this.§_-US§.§_-K2r§();
            return false;
         }
         if(!this.§_-C1L§())
         {
            return false;
         }
         if(!this.§_-73Y§ && §_-c10§.§_-73j§(Game.rights,§_-c10§.§_-33l§) && this.§_-m§.location != this.§_-GL§.location && (§_-q1p§.§_-l29§(this.§_-GL§.location).game || this.§_-GL§.location == §_-q1p§.§_-G1z§))
         {
            this.§_-US§.§_-D2O§();
            return false;
         }
         this.save();
         return true;
      }
      
      private function save() : void
      {
         this.§_-US§.§_-D5§();
         if(this.header.§_-Fa§)
         {
            if(this.§_-GL§.location == §_-q1p§.§_-l2I§)
            {
               this.§_-m§.copy(this.§_-GL§);
            }
            this.§_-m§.location = §_-q1p§.§_-u2f§;
         }
         if(this.header.§_-G22§)
         {
            if(this.header.§_-Fa§ || this.§_-m§.location != this.§_-GL§.location || this.§_-m§.mode != this.§_-GL§.mode || this.§_-m§.§_-H26§ != this.§_-GL§.§_-H26§)
            {
               §_-UC§.§_-I§(this.§_-GL§.location,this.§_-GL§.number);
               §_-UC§.§_-j1d§(this.§_-GL§.number,this.§_-m§.location,this.§_-m§.mode,this.§_-GL§.§_-i1v§,this.§_-m§.§_-H26§);
            }
            Connection.§_-Li§(§_-h2B§.§_-g2o§,this.§_-GL§.number,§_-y2d§.§_-21§ == §_-q1p§.§_-kZ§ ? §_-q1p§.§_-B2D§ : this.§_-m§.location,this.§_-m§.§_-H26§,this.§_-m§.mode,this.§_-m§.location,this.§_-m§.time,this.§_-m§.map);
            this.§_-73Y§ = false;
            if(!this.header.§_-Fa§)
            {
               this.§_-GL§.copy(this.§_-m§);
               this.§_-HH§ = this.§_-m§.map;
            }
            if(this.header.§_-Fa§ || §_-c10§.§_-73j§(Game.rights,§_-c10§.§_-33l§) && !this.§_-US§.§_-W4§)
            {
               if(§_-UC§.§_-iM§ <= 0)
               {
                  this.reset();
               }
               else
               {
                  §_-UC§.§_-aT§();
               }
               return;
            }
            if(§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-33l§) && !this.§_-US§.§_-W4§)
            {
               this.header.§_-Ao§(this.§_-m§.location);
            }
            return;
         }
         if(!§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-C2Y§))
         {
            this.§_-US§.§_-I2w§();
            this.header.block();
            this.§_-bD§.block();
            (this.map as §_-K15§).enabled = false;
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-Y2J§,this.§_-m§.mode == §_-q1p§.§_-3F§ ? §_-q1p§.§_-h2d§ : this.§_-m§.mode,this.§_-m§.time,this.§_-m§.map,this.§_-m§.location,this.§_-m§.§_-H26§);
         this.§_-73Y§ = false;
         this.§_-GL§.copy(this.§_-m§);
         this.§_-HH§ = this.§_-m§.map;
         this.header.§_-G22§ = true;
         this.§_-v1P§.§_-G22§ = true;
         if(§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-33l§) && !this.§_-US§.§_-W4§)
         {
            this.header.§_-Ao§(this.§_-m§.location);
         }
      }
      
      private function §_-s1v§(param1:Event = null) : Boolean
      {
         var date:Date;
         var shamanObjectsIds:Array;
         var data:ByteArray;
         var i:int;
         var e:Event = param1;
         §_-K1r§.§_-O1P§ = false;
         this.§_-vD§(this.§_-m§);
         date = new Date();
         shamanObjectsIds = this.§_-bD§.§_-V1R§.§_-f12§();
         data = new ByteArray();
         data.position = 0;
         data.writeUTF(this.§_-m§.map);
         data.writeInt(this.§_-m§.time);
         data.writeInt(shamanObjectsIds.length);
         i = 0;
         while(i < shamanObjectsIds.length)
         {
            data.writeInt(shamanObjectsIds[i]);
            i++;
         }
         try
         {
            this.myFileReference.save(data,"round_(" + date.fullYear + "-" + (date.month + 1) + "-" + date.date + "-" + date.hours + "-" + date.minutes + "-" + date.seconds + ").map");
            this.myFileReference.addEventListener(Event.COMPLETE,this.§_-m1f§);
         }
         catch(error:Error)
         {
            §_-TQ§.add("SquirrelGameEditor->onLocalSave: " + error.message);
         }
         return true;
      }
      
      private function §_-U11§(param1:Event = null) : Boolean
      {
         var e:Event = param1;
         §_-K1r§.§_-O1P§ = false;
         try
         {
            this.§_-T1g§.browse();
            this.§_-T1g§.addEventListener(Event.SELECT,this.§_-U2a§);
         }
         catch(error:Error)
         {
            §_-TQ§.add("SquirrelGameEditor->onLocalLoad:" + error.message);
         }
         return true;
      }
      
      private function §_-U2a§(param1:Event) : void
      {
         this.§_-T1g§.load();
         this.§_-T1g§.addEventListener(Event.COMPLETE,this.§_-Jt§);
      }
      
      private function §_-V1T§(param1:MouseEvent = null) : void
      {
         if(!this.history.§_-P2c§())
         {
            return;
         }
         this.header.§_-XO§(this.history.§_-kM§,this.history.§_-3z§);
         (this.map as §_-K15§).§_-K1n§.clear();
      }
      
      private function §_-12Q§(param1:MouseEvent = null) : void
      {
         if(!this.history.§_-82E§())
         {
            return;
         }
         this.header.§_-XO§(this.history.§_-kM§,this.history.§_-3z§);
         (this.map as §_-K15§).§_-K1n§.clear();
      }
      
      private function §_-35§() : void
      {
         this.header.§_-XO§(this.history.§_-kM§,this.history.§_-3z§);
      }
      
      private function §_-829§(param1:Boolean) : void
      {
         if(param1)
         {
            this.header.§_-83p§();
            this.§_-bD§.§_-83p§();
         }
         else
         {
            this.header.block();
            this.§_-bD§.block();
         }
      }
      
      private function §_-i2v§() : void
      {
         if(!this.§_-s2o§)
         {
            §_-UC§.§_-A2Q§();
            this.§_-829§(false);
            §_-UC§.show();
            return;
         }
         §_-UC§.§_-Q2V§(this.§_-GL§.location,this.§_-GL§.number);
         this.reset();
         this.§_-829§(false);
         this.map.§_-v2t§(true,true);
      }
      
      private function §_-q8§(param1:TimerEvent) : void
      {
         §_-52p§.§_-O2r§(this.timer.repeatCount - int(param1.currentTarget.currentCount));
      }
      
      private function §_-x1N§(param1:TimerEvent) : void
      {
         this.§_-V2z§();
      }
      
      private function §_-hz§(param1:MouseEvent) : void
      {
         this.§_-s2o§ = true;
         this.§_-US§.§_-53x§();
      }
      
      private function §_-A3n§() : int
      {
         return this.§_-v1P§.seconds + this.§_-v1P§.minutes * 60;
      }
      
      private function §_-A1p§() : void
      {
         this.timer.addEventListener(TimerEvent.TIMER,this.§_-q8§,false,0,true);
         this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.§_-x1N§,false,0,true);
      }
      
      private function §_-X2R§() : void
      {
         if(this.§_-uo§)
         {
            this.§_-V2z§();
         }
         if(!this.§_-D1w§())
         {
            this.§_-7C§();
            return;
         }
         if(§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-33l§) && this.header.§_-G22§)
         {
            this.§_-q1u§();
         }
         else if(!§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-C2Y§))
         {
            this.§_-US§.§_-i1A§();
            return;
         }
         if(this.§_-02b§())
         {
            return;
         }
         this.§_-q1u§();
      }
      
      private function §_-j2b§() : void
      {
         this.header.§_-83p§();
         this.§_-bD§.§_-83p§();
         if(!this.map)
         {
            return;
         }
         (this.map as §_-K15§).enabled = true;
      }
      
      private function §_-N1T§() : void
      {
         if(!§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-C2Y§))
         {
            this.§_-m§.location = §_-q1p§.§_-l2I§;
         }
         Connection.§_-Li§(§_-h2B§.§_-Y2J§,this.§_-m§.mode == §_-q1p§.§_-3F§ ? §_-q1p§.§_-h2d§ : this.§_-m§.mode,this.§_-m§.time,this.§_-m§.map);
         if(!§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-33l§))
         {
            §_-UC§.§_-j1d§(int(this.§_-m§.map),this.§_-m§.location,this.§_-m§.mode,Game.selfId,this.§_-m§.§_-H26§);
         }
         if(§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-33l§))
         {
            this.header.block();
            this.§_-bD§.block();
            this.exit();
            return;
         }
         §_-71o§.show("Location");
      }
      
      private function §_-X2D§() : Point
      {
         if(!this.map)
         {
            return new Point(0,0);
         }
         var _loc1_:Number = (this.map as §_-K15§).scale;
         var _loc2_:int = this.map.size.x > Game.starling.stage.stageWidth ? int(this.shift.x) : int((Game.starling.stage.stageWidth - this.map.size.x * _loc1_) * 0.5);
         var _loc3_:int = this.map.size.y > Game.starling.stage.stageHeight ? int(this.shift.y) : int((Game.starling.stage.stageHeight - this.map.size.y * _loc1_) * 0.5);
         return new Point(Math.max(_loc2_,0),Math.max(_loc3_,0));
      }
      
      private function §_-vU§() : void
      {
         §_-UC§.§_-B3B§();
         this.§_-v1P§.hide();
         this.§_-Sv§.hide();
         if(this.§_-9I§)
         {
            this.§_-9I§.removeAll();
            this.§_-9I§.hide();
         }
         this.§_-US§.§_-c2M§();
         §_-V10§.§_-J16§();
         if(this.§_-o1W§.visible)
         {
            this.§_-o1W§.hide();
         }
      }
      
      private function §_-Tk§(param1:Number) : void
      {
         this.squirrels.scaleX = this.squirrels.scaleY = param1;
         var _loc2_:§_-h2I§ = this.map.§_-P2y§;
         _loc2_.scaleFlashX = _loc2_.scaleFlashY = param1;
         _loc2_.scaleX = _loc2_.scaleY = param1;
         (this.map as §_-K15§).scale = param1;
         if(!this.cast)
         {
            return;
         }
         this.cast.scaleFlashX = this.cast.scaleFlashY = param1;
         this.cast.scaleX = this.cast.scaleY = param1;
      }
      
      private function §_-Iu§() : void
      {
         if(!this.cast)
         {
            return;
         }
         if(Hero.self)
         {
            Hero.self.§_-Yn§(false);
         }
         this.cast.castObject = null;
         §_-O1M§.§_-D2P§();
         this.cast.removeFromParent(true);
         this.cast.dispose();
         this.cast = null;
      }
   }
}

