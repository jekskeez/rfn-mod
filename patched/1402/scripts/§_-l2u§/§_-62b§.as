package §_-l2u§
{
   import §_-61C§.§_-a2p§;
   import §_-61C§.§_-sg§;
   import §_-J1i§.§_-91y§;
   import §_-J1i§.§_-k1U§;
   import §_-TK§.§_-aS§;
   import §_-X2V§.CastEvent;
   import §_-ZL§.§_-3H§;
   import §_-ZL§.§_-Ro§;
   import §_-ZL§.§_-Ti§;
   import §_-ZL§.§_-g2m§;
   import §_-ZL§.§_-lm§;
   import §_-bN§.§_-Fk§;
   import §_-c2C§.§_-H1k§;
   import §_-c2C§.§_-t2c§;
   import §_-v2M§.§_-f1C§;
   import com.api.Player;
   import com.api.PlayerEvent;
   import events.EditorEvent;
   import events.GameEvent;
   import events.§_-Am§;
   import events.§_-F2k§;
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
   import game.mainGame.§_-439§;
   import game.mainGame.entity.§_-f1b§;
   import game.mainGame.entity.§_-xn§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import tape.§_-TD§;
   import tape.§_-p2I§;
   import utils.§_-33I§;
   import utils.§_-y1l§;
   
   public class §_-62b§ extends SquirrelGame
   {
      
      private static const §_-I2K§:int = 180;
      
      public var §_-c2l§:§_-sg§ = §_-sg§.instance;
      
      public var §_-S1A§:§_-Ti§ = new §_-Ti§();
      
      public var §_-63x§:§_-lm§ = §_-lm§.instance;
      
      public var §_-nW§:Boolean = false;
      
      public var §_-I7§:§_-Kb§ = new §_-Kb§();
      
      public var §_-LL§:§_-g2m§ = null;
      
      public var header:§_-91y§ = §_-91y§.instance;
      
      public var §_-237§:Sprite = new Sprite();
      
      public var §_-l1K§:§_-aN§;
      
      public var history:§_-J1M§ = new §_-J1M§(this.map);
      
      public var §_-TJ§:§_-CD§;
      
      private var §_-R1I§:String = "";
      
      private var §_-Fm§:Boolean = false;
      
      private var §_-N2r§:Boolean = false;
      
      private var §_-51z§:Boolean = false;
      
      private var myFileReference:FileReference = new FileReference();
      
      private var §_-AL§:FileReference = new FileReference();
      
      private var §_-dF§:§_-Ro§ = null;
      
      private var §_-I2R§:§_-Kb§ = new §_-Kb§();
      
      private var §_-k1c§:§_-Kb§ = new §_-Kb§();
      
      private var timer:Timer = new Timer(1000);
      
      private var §_-Yc§:String = "";
      
      private var §_-a12§:Number = 1;
      
      private var §_-l1H§:int = 0;
      
      private var §_-F2g§:int = 0;
      
      private var §_-42z§:Boolean = false;
      
      private var §_-w1x§:§_-71a§;
      
      public function §_-62b§()
      {
         this.map = new (§_-hF§.mapClass(this.§_-l1H§,this.§_-F2g§))(this);
         this.squirrels = new (§_-hF§.collectionClass(this.§_-l1H§,this.§_-F2g§))();
         this.header.§_-w5§ = this.map as §_-53A§;
         this.§_-W1r§ = this.header;
         this.map.addEventListener(MouseEvent.CLICK,this.§_-H1h§,false,0,true);
         this.§_-LL§ = new §_-g2m§(this);
         if(§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-9F§))
         {
            this.§_-dF§ = new §_-Ro§(this.map as §_-53A§);
         }
         this.§_-TJ§ = new §_-CD§(this.§_-j1L§,this.§_-d2h§,this.§_-Z1N§,this.§_-027§,this.exit,this.§_-RX§);
         this.§_-y2F§();
         super();
         addChild(this.§_-237§);
         this.§_-l1K§ = new §_-aN§(this);
         this.§_-l1K§.x = 1;
         this.§_-l1K§.y = 29;
         addChild(this.§_-l1K§);
         this.§_-w1x§ = new §_-71a§(this);
         addChild(this.§_-w1x§);
         this.listen(true);
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-73S§,false,0,true);
      }
      
      override public function dispose() : void
      {
         this.listen(false);
         Game.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-73S§);
         if(this.squirrels)
         {
            (this.squirrels as §_-Rp§).§_-y1S§();
         }
         this.map.removeEventListener(MouseEvent.CLICK,this.§_-H1h§);
         if(this.§_-l1K§)
         {
            this.§_-l1K§.dispose();
            this.§_-l1K§ = null;
         }
         if(this.§_-w1x§)
         {
            this.§_-w1x§.dispose();
            this.§_-w1x§ = null;
         }
         super.dispose();
         this.§_-I2R§ = null;
         this.§_-k1c§ = null;
         this.§_-TJ§.dispose();
         this.§_-LL§.dispose();
      }
      
      override public function set shift(param1:Point) : void
      {
         super.shift = param1;
         if(this.§_-nW§)
         {
            return;
         }
         this.§_-237§.graphics.clear();
         this.§_-237§.graphics.lineStyle(2,49427);
         var _loc2_:int = 1;
         var _loc3_:Number = this.map.size.x * (this.map as §_-53A§).scale;
         var _loc4_:Number = this.map.size.y * (this.map as §_-53A§).scale;
         var _loc5_:int = 0;
         if(param1.x < Game.starling.stage.stageWidth && param1.x >= 0)
         {
            _loc2_ = 1;
            while(_loc2_ <= int((Game.starling.stage.stageWidth - param1.x) / _loc3_))
            {
               this.§_-237§.graphics.moveTo(param1.x + _loc3_ * _loc2_,0);
               this.§_-237§.graphics.lineTo(param1.x + _loc3_ * _loc2_,Game.starling.stage.stageHeight);
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
            this.§_-237§.graphics.moveTo(param1.x + (param1.x >= 0 ? -1 : 1) * (_loc3_ * _loc2_),0);
            this.§_-237§.graphics.lineTo(param1.x + (param1.x >= 0 ? -1 : 1) * (_loc3_ * _loc2_),Game.starling.stage.stageHeight);
            _loc2_++;
         }
         if(param1.y < Game.starling.stage.stageHeight && param1.y >= 0)
         {
            _loc2_ = 1;
            while(_loc2_ <= int((Game.starling.stage.stageHeight - param1.y) / _loc4_))
            {
               this.§_-237§.graphics.moveTo(0,param1.y + _loc4_ * _loc2_);
               this.§_-237§.graphics.lineTo(Game.starling.stage.stageWidth,param1.y + _loc4_ * _loc2_);
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
            this.§_-237§.graphics.moveTo(0,param1.y + (param1.y >= 0 ? -1 : 1) * (_loc4_ * _loc2_));
            this.§_-237§.graphics.lineTo(Game.starling.stage.stageWidth,param1.y + (param1.y >= 0 ? -1 : 1) * (_loc4_ * _loc2_));
            _loc2_++;
         }
         if(Boolean(this.§_-l1K§) && this.§_-l1K§.visible)
         {
            this.§_-l1K§.update();
         }
      }
      
      public function get §_-91A§() : int
      {
         return this.§_-I2R§.number;
      }
      
      public function get location() : int
      {
         return this.§_-I2R§.location;
      }
      
      public function get §_-DL§() : Boolean
      {
         return this.§_-nW§;
      }
      
      public function get §_-YH§() : int
      {
         return this.§_-I7§.location;
      }
      
      public function get §_-H2E§() : int
      {
         return this.§_-I7§.mode;
      }
      
      public function get scale() : Number
      {
         return this.§_-a12§;
      }
      
      public function set scale(param1:Number) : void
      {
         if(this.§_-nW§)
         {
            return;
         }
         if(this.§_-a12§ == param1)
         {
            return;
         }
         if(param1 > §_-71a§.§_-A3E§ || param1 < §_-71a§.§_-P11§)
         {
            return;
         }
         this.§_-a12§ = param1;
         this.§_-Q8§(param1);
         this.shift = this.§_-N1P§();
         (this.map as §_-53A§).§_-B3S§.clear();
         (this.map as §_-53A§).§_-P2P§(this.§_-c2l§.§_-23H§);
         this.header.§_-9j§(this.§_-a12§);
      }
      
      public function §_-h1K§() : void
      {
         this.§_-81n§(false);
         this.reset();
         this.§_-S1A§.show();
         this.§_-Fm§ = false;
      }
      
      public function §_-S1Y§(param1:int, param2:int, param3:int, param4:int) : void
      {
         this.reset();
         this.header.§_-wA§ = true;
         this.§_-63x§.§_-wA§ = true;
         this.§_-I7§.reset();
         this.§_-N2r§ = false;
         this.map.clear();
         this.§_-uf§();
         this.header.§_-9j§(this.§_-a12§);
         this.header.§_-wA§ = true;
         this.§_-63x§.hide();
         this.§_-63x§.§_-wA§ = true;
         this.§_-63x§.silent = true;
         this.§_-63x§.§_-K2v§();
         this.§_-c2l§.§_-S1Y§(param1);
         this.header.§_-S1Y§(param1);
         this.§_-63x§.§_-X1L§.§_-23V§(param3);
         this.§_-63x§.§_-q2x§();
         this.§_-63x§.§_-WA§.§_-23V§(param1);
         this.§_-63x§.§_-rr§(null);
         this.§_-63x§.silent = false;
         this.§_-I2R§.number = param2;
         this.§_-I2R§.location = param1;
         this.§_-I2R§.§_-W22§ = param4;
         this.§_-y2J§(null);
         var _loc5_:Boolean = §_-lp§.last == param2 && !§_-lp§.isEmpty;
         var _loc6_:Boolean = §_-lp§.first == param2 && !§_-lp§.isEmpty;
         this.header.§_-y1a§.enabled = this.header.§_-y1a§.mouseEnabled = !_loc5_;
         this.header.§_-y1a§.filters = _loc5_ ? §_-y1l§.§_-Tk§ : [];
         this.header.§_-k2b§.enabled = this.header.§_-k2b§.mouseEnabled = !_loc6_;
         this.header.§_-k2b§.filters = _loc6_ ? §_-y1l§.§_-Tk§ : [];
         Connection.§_-e2T§(§_-u1O§.§_-n2D§,param2);
         this.§_-Fm§ = false;
      }
      
      public function §_-O1A§(param1:int = 0, param2:int = 0, param3:int = 0) : void
      {
         this.reset();
         this.§_-I2R§.reset();
         this.§_-63x§.§_-T1K§();
         this.§_-uf§();
         this.§_-c2l§.§_-O1A§();
         this.header.§_-O1A§();
         this.§_-Fm§ = false;
         this.§_-l1K§.§_-Jj§();
         this.header.§_-wA§ = false;
         this.§_-63x§.§_-wA§ = false;
         this.§_-63x§.§_-K2v§();
         this.§_-I7§.reset();
         this.§_-N2r§ = true;
         this.§_-y2J§(null);
         this.§_-63x§.§_-43C§(§_-I2K§);
         this.§_-63x§.rating(0,0,0,0,0);
         this.header.§_-31f§.text = "";
         this.§_-63x§.silent = true;
         this.§_-63x§.§_-WA§.§_-23V§(param1);
         this.§_-63x§.§_-rr§(null);
         this.§_-63x§.mode = param2;
         this.§_-63x§.sub = param3;
         this.§_-63x§.silent = false;
         this.§_-63x§.show();
         (this.map as §_-53A§).§_-P2P§(this.§_-c2l§.§_-23H§);
         this.§_-aZ§();
         if(§_-H1k§.instance)
         {
            §_-H1k§.instance.§_-ji§(param1,param2);
         }
      }
      
      public function §_-C1m§() : void
      {
         this.§_-TJ§.§_-N2E§();
      }
      
      public function reset(param1:Boolean = true) : void
      {
         if(this.§_-l1K§)
         {
            this.§_-l1K§.hide();
         }
         if(this.squirrels)
         {
            (this.squirrels as §_-Rp§).§_-y1S§();
         }
         (this.map as §_-53A§).§_-y1S§();
         this.§_-nW§ = false;
         this.§_-c2l§.reset();
         this.timer.stop();
         §_-k1U§.clear();
         if(this.§_-dF§)
         {
            this.§_-dF§.removeAll();
         }
         if(this.squirrels)
         {
            this.squirrels.clear();
         }
         if(this.map)
         {
            this.map.clear();
            (this.map as §_-53A§).enabled = true;
            this.map.visible = true;
         }
         if(param1)
         {
            this.shift = this.§_-N1P§();
         }
         §_-733§();
      }
      
      public function §_-014§(param1:Event) : void
      {
         var lengthIds:int = 0;
         var shamanObjectsIds:Array = null;
         var i:int = 0;
         var e:Event = param1;
         try
         {
            this.§_-AL§.data.position = 0;
            this.§_-k1c§.map = this.§_-AL§.data.readUTF();
            this.§_-k1c§.time = this.§_-AL§.data.readInt();
            lengthIds = this.§_-AL§.data.readInt();
            shamanObjectsIds = [];
            i = 0;
            while(i < lengthIds)
            {
               shamanObjectsIds.push(this.§_-AL§.data.readInt());
               i++;
            }
            this.§_-l1K§.§_-Jj§();
            this.§_-c2l§.§_-aR§(shamanObjectsIds);
            this.map.§_-o2I§(this.§_-k1c§.map);
            this.§_-63x§.§_-T1K§();
            this.§_-63x§.§_-43C§(this.§_-k1c§.time);
            this.§_-63x§.§_-ZY§();
            (this.map as §_-53A§).§_-B3S§.clear();
            this.§_-y2J§(null);
            this.shift = this.§_-N1P§();
            this.header.§_-rd§();
            this.history.clear();
            this.§_-uf§();
         }
         catch(error:Error)
         {
            §_-p2U§.add("SquirrelGameEditor->onFileLoaded: " + error.message);
         }
      }
      
      public function §_-Vb§() : void
      {
         if(!this.history.§_-Vb§())
         {
            return;
         }
         this.header.§_-d11§(this.history.§_-03U§,this.history.§_-N29§);
         this.§_-51z§ = false;
      }
      
      public function §_-gq§(param1:MouseEvent) : void
      {
         this.§_-63x§.show();
      }
      
      public function §_-JG§(param1:MouseEvent) : void
      {
         if(this.§_-dF§)
         {
            this.§_-dF§.show();
         }
      }
      
      public function §_-61A§(param1:MouseEvent = null) : void
      {
         this.§_-c2l§.visible = true;
         if(this.§_-dF§)
         {
            this.§_-dF§.removeAll();
            this.§_-dF§.hide();
         }
         this.§_-33L§();
         §_-a2p§.hide();
         §_-a2p§.hero = null;
         §_-a2p§.§_-Dg§(this.§_-BS§);
         this.reset(false);
         this.§_-nW§ = false;
         this.§_-d§ = false;
         this.§_-T1y§ = false;
         this.§_-c2l§.§_-hP§(true);
         this.squirrels.clear();
         this.map.§_-o2I§(this.§_-R1I§);
         (this.map as §_-53A§).enabled = true;
         this.§_-Q8§(this.§_-a12§);
         this.§_-237§.visible = true;
         this.shift = this.§_-N1P§();
         this.§_-aZ§();
         this.header.§_-61A§(null);
         this.header.§_-9j§(this.§_-a12§);
      }
      
      public function §_-43X§(param1:MouseEvent = null) : void
      {
         this.§_-t1i§();
         §_-H1k§.§_-t1y§ = {};
         this.§_-Mr§();
         (this.map as §_-53A§).§_-P2P§(this.§_-c2l§.§_-23H§);
         if(this.§_-nW§)
         {
            this.map.§_-o2I§(this.§_-R1I§);
         }
         else
         {
            this.§_-R1I§ = this.map.§_-m1Y§();
         }
         this.§_-D2d§(this.§_-I7§,this.§_-R1I§);
         (this.map as §_-53A§).enabled = false;
         this.§_-c2l§.visible = false;
         if(this.cast)
         {
            this.cast.removeFromParent(true);
            this.cast.dispose();
         }
         this.cast = §_-3H§.§_-rD§.§_-RR§ || §_-3H§.§_-rD§.§_-hY§ ? new §_-f1C§(this) : new Cast(this);
         §_-J2J§(this.cast);
         this.§_-Q8§(1);
         this.§_-nW§ = true;
         this.§_-237§.visible = false;
         (this.map as §_-53A§).§_-Q1J§();
         this.shift = this.§_-N1P§();
         §_-526§();
         this.§_-T1y§ = this.§_-H2E§ == §_-at§.§_-Tj§;
         (this.squirrels as §_-Rp§).§_-R10§(this.§_-H2E§,this.§_-LL§);
         this.§_-LL§.§_-e2d§();
         this.§_-yA§();
         this.§_-d§ = true;
         §_-a2p§.§_-N2j§ = true;
         §_-a2p§.show();
         §_-a2p§.§_-f15§(this.§_-BS§);
         §_-a2p§.§_-j2F§ = §_-s2l§.ROUND_START;
         this.§_-c2l§.§_-hP§(false);
         this.header.§_-a1m§(this.§_-63x§.minutes,this.§_-63x§.seconds);
         this.timer.repeatCount = int(this.§_-63x§.minutes) * 60 + int(this.§_-63x§.seconds);
         this.timer.reset();
         this.timer.start();
         this.header.§_-43X§();
      }
      
      public function §_-x2I§(param1:Event = null) : void
      {
         var _loc2_:Boolean = false;
         if(this.§_-nW§)
         {
            this.§_-61A§();
         }
         else
         {
            this.header.§_-rd§();
            this.header.§_-61A§(null);
         }
         (this.map as §_-53A§).§_-B3S§.clear();
         this.§_-D2d§(this.§_-k1c§);
         this.history.clear();
         if(this.header.§_-wA§)
         {
            _loc2_ = !this.§_-k1c§.§_-93W§(this.§_-I2R§);
         }
         else
         {
            _loc2_ = !this.map.isEmpty();
         }
         if(_loc2_ && !this.§_-51z§)
         {
            if(this.§_-63x§.§_-5V§ == Game.selfId || §_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-9F§) || !this.header.§_-wA§)
            {
               this.§_-TJ§.§_-F1n§();
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
      
      public function §_-23B§(param1:Event) : void
      {
         this.§_-51z§ = true;
         this.history.clear();
         this.§_-uf§();
      }
      
      public function §_-RX§() : void
      {
         this.§_-R1I§ = this.map.§_-m1Y§();
         this.§_-81n§(true);
         this.squirrels.clear();
         this.map.§_-o2I§(this.§_-R1I§);
         (this.map as §_-53A§).enabled = !this.§_-nW§;
         this.§_-d§ = this.§_-nW§;
         this.§_-c2l§.§_-aR§(this.map.§_-d14§);
         (this.map as §_-53A§).§_-P2P§(this.§_-c2l§.§_-23H§);
         this.§_-c2l§.§_-hP§(true);
         if(this.§_-nW§)
         {
            this.§_-yA§();
         }
      }
      
      public function §_-ji§(param1:int, param2:int, param3:String = null) : void
      {
         var mapClass:Class;
         var collectionClass:Class;
         var oldMap:§_-53A§ = null;
         var oldSquirrels:* = undefined;
         var mapData:String = null;
         var shift:Point = null;
         var locationId:int = param1;
         var modeId:int = param2;
         var serializedMap:String = param3;
         if(this.§_-nW§ || this.§_-42z§)
         {
            return;
         }
         mapClass = §_-hF§.mapClass(locationId,modeId);
         collectionClass = §_-hF§.collectionClass(locationId,modeId);
         if(getQualifiedClassName(this.map) == getQualifiedClassName(mapClass) && getQualifiedClassName(this.squirrels) == getQualifiedClassName(collectionClass))
         {
            this.§_-l1H§ = locationId;
            this.§_-F2g§ = modeId;
            if(serializedMap != null)
            {
               this.map.§_-o2I§(serializedMap);
            }
            return;
         }
         this.§_-42z§ = true;
         try
         {
            oldMap = this.map as §_-53A§;
            oldSquirrels = this.squirrels;
            mapData = serializedMap != null ? serializedMap : this.map.§_-m1Y§();
            shift = this.shift;
            if(this.§_-dF§)
            {
               this.§_-dF§.§_-a1r§(null);
            }
            this.§_-l1H§ = locationId;
            this.§_-F2g§ = modeId;
            this.map = new mapClass(this);
            this.squirrels = new collectionClass();
            this.§_-Lo§(oldMap,oldSquirrels);
            this.§_-O1z§();
            this.history.§_-a1r§(this.map);
            this.header.§_-w5§ = this.map as §_-53A§;
            if(this.§_-dF§)
            {
               this.§_-dF§.§_-a1r§(this.map as §_-53A§);
            }
            this.map.§_-o2I§(mapData);
            this.shift = shift;
         }
         finally
         {
            this.§_-42z§ = false;
         }
      }
      
      public function §_-Lw§() : void
      {
         this.header.§_-w5§ = this.map as §_-53A§;
         this.§_-c2l§.§_-kn§(this.map.§_-d14§);
         (this.map as §_-53A§).§_-P2P§(this.§_-c2l§.§_-23H§);
         (this.map as §_-53A§).§_-U1S§();
         if((this.map as §_-53A§).scale != this.§_-a12§)
         {
            this.§_-Q8§(this.§_-a12§);
         }
         this.header.§_-9j§(this.§_-a12§);
         §_-91y§.show();
         §_-sg§.show();
         this.§_-LL§.§_-e2d§();
      }
      
      public function §_-Y16§(param1:PlayerEvent) : void
      {
         if(this.§_-I2R§.§_-I1a§ == -1 && this.map.§_-FX§ == 0)
         {
            return;
         }
         var _loc2_:Player = param1.player;
         if(_loc2_.id == this.§_-I2R§.§_-I1a§)
         {
            this.§_-63x§.§_-5V§ = _loc2_.id;
         }
         if(_loc2_.id == this.map.§_-FX§)
         {
            this.§_-63x§.§_-E1v§ = _loc2_.id;
         }
      }
      
      public function §_-x2f§(param1:§_-s2l§) : void
      {
         switch(param1.type)
         {
            case §_-s2l§.§_-02u§:
               if(this.§_-I2R§.number != param1[0])
               {
                  return;
               }
               this.§_-I2R§.load(param1.slice(1,param1.length));
               this.§_-R1I§ = this.§_-I2R§.map;
               this.§_-63x§.§_-43C§(this.§_-I2R§.time);
               this.§_-63x§.map = this.§_-I2R§.number;
               this.§_-63x§.silent = true;
               if(this.§_-I2R§.location)
               {
                  this.§_-63x§.§_-WA§.§_-23V§(this.§_-I2R§.location);
                  this.§_-63x§.§_-rr§(null);
               }
               this.§_-63x§.mode = this.§_-I2R§.mode;
               this.§_-63x§.sub = this.§_-I2R§.§_-W22§;
               this.§_-63x§.silent = false;
               this.§_-63x§.rating(this.§_-I2R§.§_-l2F§,this.§_-I2R§.§_-U27§,this.§_-I2R§.§_-p1h§,this.§_-I2R§.§_-y1C§,this.§_-I2R§.§_-I1I§);
               this.§_-63x§.§_-ZY§();
               this.header.§_-31f§.htmlText = "<a href=\'event:#\'>" + String(this.§_-I2R§.number) + "</a>";
               this.reset();
               this.§_-l1K§.§_-Jj§();
               this.§_-nW§ = false;
               this.§_-d§ = false;
               if(§_-H1k§.instance)
               {
                  §_-H1k§.instance.§_-ji§(this.§_-63x§.§_-F2u§,this.§_-63x§.mode,this.§_-R1I§);
               }
               else
               {
                  this.§_-ji§(this.§_-63x§.§_-F2u§,this.§_-63x§.mode,this.§_-R1I§);
                  this.§_-y2J§(null);
                  this.§_-Lw§();
               }
               (this.map as §_-53A§).enabled = true;
               if(this.map.§_-FX§ == 0)
               {
                  this.§_-63x§.§_-E1v§ = 0;
                  Game.request(this.§_-I2R§.§_-I1a§,§_-Y2E§.§_-n2H§);
               }
               else
               {
                  Game.request([this.§_-I2R§.§_-I1a§,this.map.§_-FX§],§_-Y2E§.§_-n2H§);
               }
               this.§_-aZ§();
               break;
            case §_-s2l§.§_-T10§:
               this.§_-I2R§.number = param1[0];
               this.§_-I2R§.§_-W22§ = param1[2];
               if(this.§_-I2R§.number == 0)
               {
                  §_-p2U§.add("Error wrong number of map");
                  return;
               }
               §_-Ti§.§_-O1z§(this.§_-I2R§.number,this.§_-k1c§.location,this.§_-k1c§.mode,Game.selfId,this.§_-k1c§.§_-W22§);
               this.§_-63x§.map = this.§_-I2R§.number;
               this.header.§_-31f§.htmlText = "<a href=\'event:#\'>" + String(this.§_-I2R§.number) + "</a>";
               this.§_-63x§.§_-5V§ = Game.selfId;
         }
      }
      
      public function §_-pw§(param1:Event) : void
      {
         new §_-Fk§(gls("ВНИМАНИЕ!"),gls("Соединение с сервером было разорвано.\nСохраните карту локально и перезапустите игру!")).show();
         this.header.connectionClosed = true;
         this.header.§_-m2H§();
      }
      
      public function §_-s2U§() : void
      {
         this.shift = this.§_-N1P§();
      }
      
      protected function §_-GU§() : Boolean
      {
         var _loc1_:int = this.§_-63x§.§_-F2u§;
         var _loc2_:int = this.§_-63x§.mode;
         if(!(this.map as §_-53A§).§_-MA§(_loc1_,_loc2_))
         {
            return false;
         }
         var _loc3_:int = this.§_-B3n§();
         if(_loc3_ < Game.§_-m26§)
         {
            this.§_-TJ§.§_-xe§((this.map as §_-53A§).§_-h2S§(_loc1_,_loc2_));
            return false;
         }
         return true;
      }
      
      private function §_-Lo§(param1:§_-53A§, param2:*) : void
      {
         if(!param1)
         {
            return;
         }
         param1.removeEventListener(MouseEvent.CLICK,this.§_-H1h§);
         if(param2)
         {
            (param2 as §_-Rp§).§_-y1S§();
         }
         removeChildStarling(param1.§_-n2B§);
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
         if(this.§_-Qd§)
         {
            this.§_-Qd§.dispose();
            removeChildStarling(this.§_-Qd§);
            this.§_-Qd§ = null;
         }
      }
      
      private function §_-O1z§() : void
      {
         addChildAt(this.map,0);
         §_-J2J§(this.squirrels);
         addChild(this.squirrels);
         §_-J2J§(this.map.§_-n2B§);
         this.§_-Qd§ = new §_-439§(this.map);
         §_-J2J§(this.§_-Qd§);
         this.map.addEventListener(MouseEvent.CLICK,this.§_-H1h§,false,0,true);
      }
      
      private function §_-y2J§(param1:GameEvent) : void
      {
         (this.map as §_-53A§).§_-U1S§();
      }
      
      private function §_-Q12§(param1:MouseEvent) : void
      {
         this.§_-l1K§.toggle();
      }
      
      private function §_-V1S§(param1:MouseEvent) : void
      {
         this.§_-w1x§.§_-KW§(-§_-71a§.§_-I1k§);
      }
      
      private function §_-Y12§(param1:MouseEvent) : void
      {
         this.§_-w1x§.§_-KW§(§_-71a§.§_-I1k§);
      }
      
      private function §_-DP§(param1:MouseEvent) : void
      {
         §_-3H§.show(this);
      }
      
      private function §_-rn§(param1:MouseEvent) : void
      {
         this.shift = this.§_-N1P§();
         if(param1)
         {
            if(param1.currentTarget is ButtonNextMap)
            {
               this.§_-Yc§ = "Next";
            }
            else if(param1.currentTarget is ButtonPrevMap)
            {
               this.§_-Yc§ = "Prev";
            }
         }
         if(!§_-Ti§.§_-K2L§(this.§_-I2R§.number,this.§_-Yc§))
         {
            this.§_-Yc§ = "";
            return;
         }
         this.§_-x2I§();
      }
      
      private function §_-6g§() : Boolean
      {
         if(this.§_-Yc§ == "")
         {
            return false;
         }
         switch(this.§_-Yc§)
         {
            case "Next":
               §_-Ti§.§_-810§(this.§_-I2R§.number);
               break;
            case "Prev":
               §_-Ti§.§_-WV§(this.§_-I2R§.number);
         }
         this.§_-Yc§ = "";
         return true;
      }
      
      private function §_-T2F§(param1:MouseEvent) : void
      {
         if(!this.map)
         {
            return;
         }
         (this.map as §_-53A§).§_-B3S§.clear();
      }
      
      private function §_-H1h§(param1:MouseEvent) : void
      {
         this.§_-aZ§();
      }
      
      private function §_-yA§() : void
      {
         var _loc1_:§_-Rp§ = this.squirrels as §_-Rp§;
         _loc1_.clear();
         var _loc2_:int = _loc1_.§_-A3b§();
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
         _loc1_.§_-V25§();
         _loc1_.place();
         _loc1_.show();
         _loc1_.next();
      }
      
      private function §_-D2d§(param1:§_-Kb§, param2:String = null) : void
      {
         this.§_-63x§.§_-S1§();
         param1.time = this.§_-B3n§();
         param1.location = this.§_-63x§.§_-F2u§;
         param1.mode = this.§_-63x§.mode;
         param1.§_-W22§ = this.§_-63x§.sub;
         param1.number = this.§_-I2R§.number;
         param1.§_-I1a§ = this.§_-I2R§.§_-I1a§;
         (this.map as §_-53A§).§_-P2P§(this.§_-c2l§.§_-23H§);
         if(this.§_-nW§)
         {
            param1.map = this.§_-I7§.map;
         }
         else
         {
            param1.map = param2 ? param2 : this.map.§_-m1Y§();
            this.map.§_-FX§ = Game.selfId;
         }
      }
      
      private function §_-N1q§(param1:Event = null) : void
      {
         this.§_-LL§.§_-e2d§();
         this.§_-y2J§(null);
      }
      
      private function listen(param1:Boolean) : void
      {
         var _loc2_:String = null;
         var _loc3_:Array = null;
         var _loc4_:Object = null;
         this.§_-n2U§(this.§_-LL§,GameEvent.SWAP_BACKGROUND,this.§_-y2J§,param1);
         this.§_-n2U§(this.§_-63x§,EditorEvent.LOCATION_CHANGED,this.§_-N1q§,param1);
         this.§_-n2U§(this.§_-63x§,EditorEvent.MODE_CHANGED,this.§_-N1q§,param1);
         this.§_-n2U§(this.§_-63x§,EditorEvent.SUBLOCATION_CHANGED,this.§_-N1q§,param1);
         this.§_-n2U§(this.§_-c2l§,MouseEvent.CLICK,this.§_-T2F§,param1,true);
         this.§_-51l§(this.§_-c2l§.§_-Qe§,param1);
         this.§_-51l§(this.§_-c2l§.§_-y1r§,param1);
         for(_loc2_ in this.§_-c2l§.§_-T1C§)
         {
            this.§_-n2U§(this.§_-c2l§.§_-T1C§[_loc2_] as §_-TD§,§_-F2k§.§_-I5§,this.§_-r10§,param1);
         }
         for(_loc2_ in this.§_-c2l§.§_-K2t§)
         {
            this.§_-n2U§(this.§_-c2l§.§_-K2t§[_loc2_] as §_-p2I§,§_-F2k§.§_-I5§,this.§_-r10§,param1);
         }
         for(_loc2_ in this.§_-c2l§.§_-w2H§)
         {
            this.§_-n2U§(this.§_-c2l§.§_-w2H§[_loc2_] as §_-p2I§,§_-F2k§.§_-I5§,this.§_-r10§,param1);
         }
         _loc3_ = [{
            "button":this.header.§_-43O§,
            "handler":this.§_-43X§
         },{
            "button":this.header.§_-73Y§,
            "handler":this.§_-61A§
         },{
            "button":this.header.§_-y1a§,
            "handler":this.§_-rn§
         },{
            "button":this.header.§_-k2b§,
            "handler":this.§_-rn§
         },{
            "button":this.header.§_-wE§,
            "handler":this.§_-73C§
         },{
            "button":this.header.§_-93C§,
            "handler":this.§_-4f§
         },{
            "button":this.header.§_-e2r§,
            "handler":this.§_-l9§
         },{
            "button":this.header.§_-tK§,
            "handler":this.§_-HQ§
         },{
            "button":this.header.§_-H5§,
            "handler":this.§_-HQ§
         },{
            "button":this.header.§_-ZX§,
            "handler":this.§_-y1U§
         },{
            "button":this.header.§_-G1Y§,
            "handler":this.§_-71y§
         },{
            "button":this.header.§_-11v§,
            "handler":this.§_-Q12§
         },{
            "button":this.header.§_-gw§,
            "handler":this.§_-V1S§
         },{
            "button":this.header.§_-Cf§,
            "handler":this.§_-Y12§
         },{
            "button":this.header.§_-81l§,
            "handler":this.§_-DP§
         },{
            "button":this.header.§_-a1d§,
            "handler":this.§_-gq§
         },{
            "button":this.header.§_-B2Z§,
            "handler":this.§_-o1C§
         },{
            "button":this.header.§_-73G§,
            "handler":this.§_-JG§
         },{
            "button":this.header.§_-f26§,
            "handler":this.§_-x2I§
         }];
         for each(_loc4_ in _loc3_)
         {
            this.§_-n2U§(_loc4_.button,MouseEvent.CLICK,_loc4_.handler,param1);
         }
      }
      
      private function §_-n2U§(param1:EventDispatcher, param2:String, param3:Function, param4:Boolean, param5:Boolean = false) : void
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
      
      private function §_-51l§(param1:Array, param2:Boolean) : void
      {
         var _loc3_:EventDispatcher = null;
         for each(_loc3_ in param1)
         {
            this.§_-n2U§(_loc3_,§_-F2k§.§_-I5§,this.§_-r10§,param2);
         }
      }
      
      private function §_-Mr§() : void
      {
         var _loc1_:DisplayObject = null;
         if(!this.map)
         {
            return;
         }
         for each(_loc1_ in this.map.get(§_-xn§,true))
         {
            if(_loc1_)
            {
               _loc1_.x = Math.round(_loc1_.x);
               _loc1_.y = Math.round(_loc1_.y);
            }
         }
      }
      
      private function §_-o1C§(param1:MouseEvent) : void
      {
         this.§_-LL§.show();
      }
      
      private function §_-73S§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.E && param1.ctrlKey)
         {
            this.§_-LL§.show();
         }
         if(param1.keyCode == Keyboard.M && param1.ctrlKey)
         {
            §_-p2U§.add("MAP trace:",this.map.§_-m1Y§());
         }
         if(param1.keyCode == Keyboard.Q && param1.ctrlKey && param1.altKey && Boolean(this.§_-dF§))
         {
            this.§_-dF§.show();
         }
         if(param1.keyCode == Keyboard.B && param1.ctrlKey && !this.§_-nW§)
         {
            this.§_-y2J§(null);
         }
         if(param1.keyCode == Keyboard.R && param1.ctrlKey)
         {
            this.§_-l1K§.toggle();
         }
         if(Game.stage.focus != this.map && Game.stage.focus != this.§_-63x§)
         {
            return;
         }
         switch(param1.keyCode)
         {
            case Keyboard.NUMPAD_ADD:
               if(Boolean(this.header.§_-a1d§.enabled) && !param1.ctrlKey)
               {
                  if(this.§_-63x§.visible)
                  {
                     this.§_-63x§.hide();
                  }
                  else
                  {
                     this.§_-63x§.show();
                  }
               }
               break;
            case Keyboard.NUMPAD_4:
               if(this.header.§_-k2b§.enabled)
               {
                  this.§_-Yc§ = "Prev";
                  this.§_-rn§(null);
               }
               break;
            case Keyboard.NUMPAD_6:
               if(this.header.§_-y1a§.enabled)
               {
                  this.§_-Yc§ = "Next";
                  this.§_-rn§(null);
               }
               break;
            case Keyboard.NUMPAD_DECIMAL:
               if(Boolean(this.header.§_-wE§.enabled) && §_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-9F§))
               {
                  this.§_-73C§(null);
               }
               break;
            case Keyboard.ENTER:
               if(!this.§_-TJ§.§_-z28§ || !§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-9F§))
               {
                  return;
               }
               this.§_-j1L§();
               this.§_-TJ§.§_-Ez§();
         }
      }
      
      private function §_-BS§(param1:§_-Am§) : void
      {
         if(!this.§_-nW§)
         {
            return;
         }
         this.cast.§_-ff§(new CastEvent(CastEvent.SELECT,param1.className));
      }
      
      private function §_-r10§(param1:§_-F2k§) : void
      {
         var _loc2_:int = §_-f1b§.§_-q2W§(param1.className);
         (this.map as §_-53A§).§_-o1j§(_loc2_);
         this.§_-aZ§();
         this.§_-Vb§();
      }
      
      private function §_-aZ§() : void
      {
         Game.stage.focus = this.map;
      }
      
      private function block() : void
      {
         this.§_-81n§(false);
         this.§_-d§ = false;
         (this.map as §_-53A§).enabled = false;
      }
      
      private function exit() : void
      {
         if(this.§_-6g§())
         {
            return;
         }
         this.§_-I2R§.number = -1;
         if(!§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-9F§))
         {
            §_-t2c§.show("Location");
            return;
         }
         this.squirrels.clear();
         this.map.clear();
         if(§_-Ti§.§_-41k§())
         {
            §_-t2c§.show("Location");
            return;
         }
         this.§_-h1K§();
      }
      
      private function §_-HQ§(param1:Event = null) : Boolean
      {
         this.§_-D2d§(this.§_-k1c§);
         if(!§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-9F§) && !this.§_-I7§.§_-93W§(this.§_-k1c§))
         {
            this.§_-TJ§.§_-zZ§();
            return false;
         }
         if(!this.§_-GU§())
         {
            return false;
         }
         if(!this.§_-N2r§ && §_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-Dk§) && this.§_-k1c§.location != this.§_-I2R§.location && (§_-at§.§_-13l§(this.§_-I2R§.location).game || this.§_-I2R§.location == §_-at§.§_-Uf§))
         {
            this.§_-TJ§.§_-J1B§();
            return false;
         }
         this.save();
         return true;
      }
      
      private function save() : void
      {
         this.§_-TJ§.§_-Ez§();
         if(this.header.§_-8§)
         {
            if(this.§_-I2R§.location == §_-at§.§_-lg§)
            {
               this.§_-k1c§.copy(this.§_-I2R§);
            }
            this.§_-k1c§.location = §_-at§.§_-22E§;
         }
         if(this.header.§_-wA§)
         {
            if(this.header.§_-8§ || this.§_-k1c§.location != this.§_-I2R§.location || this.§_-k1c§.mode != this.§_-I2R§.mode || this.§_-k1c§.§_-W22§ != this.§_-I2R§.§_-W22§)
            {
               §_-Ti§.§_-W1Y§(this.§_-I2R§.location,this.§_-I2R§.number);
               §_-Ti§.§_-O1z§(this.§_-I2R§.number,this.§_-k1c§.location,this.§_-k1c§.mode,this.§_-I2R§.§_-I1a§,this.§_-k1c§.§_-W22§);
            }
            Connection.§_-e2T§(§_-u1O§.§_-k0§,this.§_-I2R§.number,§_-lm§.§_-uj§ == §_-at§.§_-e2M§ ? §_-at§.§_-820§ : this.§_-k1c§.location,this.§_-k1c§.§_-W22§,this.§_-k1c§.mode,this.§_-k1c§.location,this.§_-k1c§.time,this.§_-k1c§.map);
            this.§_-N2r§ = false;
            if(!this.header.§_-8§)
            {
               this.§_-I2R§.copy(this.§_-k1c§);
               this.§_-R1I§ = this.§_-k1c§.map;
            }
            if(this.header.§_-8§ || §_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-Dk§) && !this.§_-TJ§.§_-qj§)
            {
               if(§_-Ti§.§_-Es§ <= 0)
               {
                  this.reset();
               }
               else
               {
                  §_-Ti§.§_-p1n§();
               }
               return;
            }
            if(§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-Dk§) && !this.§_-TJ§.§_-qj§)
            {
               this.header.§_-S1Y§(this.§_-k1c§.location);
            }
            return;
         }
         if(!§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-9F§))
         {
            this.§_-TJ§.§_-X2t§();
            this.header.block();
            this.§_-c2l§.block();
            (this.map as §_-53A§).enabled = false;
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-ks§,this.§_-k1c§.mode == §_-at§.§_-dH§ ? §_-at§.§_-n1O§ : this.§_-k1c§.mode,this.§_-k1c§.time,this.§_-k1c§.map,this.§_-k1c§.location,this.§_-k1c§.§_-W22§);
         this.§_-N2r§ = false;
         this.§_-I2R§.copy(this.§_-k1c§);
         this.§_-R1I§ = this.§_-k1c§.map;
         this.header.§_-wA§ = true;
         this.§_-63x§.§_-wA§ = true;
         if(§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-Dk§) && !this.§_-TJ§.§_-qj§)
         {
            this.header.§_-S1Y§(this.§_-k1c§.location);
         }
      }
      
      private function §_-4f§(param1:Event = null) : Boolean
      {
         var date:Date;
         var shamanObjectsIds:Array;
         var data:ByteArray;
         var i:int;
         var e:Event = param1;
         §_-73Q§.§_-R1R§ = false;
         this.§_-D2d§(this.§_-k1c§);
         date = new Date();
         shamanObjectsIds = this.§_-c2l§.§_-23H§.§_-n2K§();
         data = new ByteArray();
         data.position = 0;
         data.writeUTF(this.§_-k1c§.map);
         data.writeInt(this.§_-k1c§.time);
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
            this.myFileReference.addEventListener(Event.COMPLETE,this.§_-23B§);
         }
         catch(error:Error)
         {
            §_-p2U§.add("SquirrelGameEditor->onLocalSave: " + error.message);
         }
         return true;
      }
      
      private function §_-l9§(param1:Event = null) : Boolean
      {
         var e:Event = param1;
         §_-73Q§.§_-R1R§ = false;
         try
         {
            this.§_-AL§.browse();
            this.§_-AL§.addEventListener(Event.SELECT,this.§_-C2c§);
         }
         catch(error:Error)
         {
            §_-p2U§.add("SquirrelGameEditor->onLocalLoad:" + error.message);
         }
         return true;
      }
      
      private function §_-C2c§(param1:Event) : void
      {
         this.§_-AL§.load();
         this.§_-AL§.addEventListener(Event.COMPLETE,this.§_-014§);
      }
      
      private function §_-y1U§(param1:MouseEvent = null) : void
      {
         if(!this.history.§_-A1x§())
         {
            return;
         }
         this.header.§_-d11§(this.history.§_-03U§,this.history.§_-N29§);
         (this.map as §_-53A§).§_-B3S§.clear();
      }
      
      private function §_-71y§(param1:MouseEvent = null) : void
      {
         if(!this.history.§_-r2i§())
         {
            return;
         }
         this.header.§_-d11§(this.history.§_-03U§,this.history.§_-N29§);
         (this.map as §_-53A§).§_-B3S§.clear();
      }
      
      private function §_-uf§() : void
      {
         this.header.§_-d11§(this.history.§_-03U§,this.history.§_-N29§);
      }
      
      private function §_-81n§(param1:Boolean) : void
      {
         if(param1)
         {
            this.header.§_-Wy§();
            this.§_-c2l§.§_-Wy§();
         }
         else
         {
            this.header.block();
            this.§_-c2l§.block();
         }
      }
      
      private function §_-j1L§() : void
      {
         if(!this.§_-Fm§)
         {
            §_-Ti§.§_-Yg§();
            this.§_-81n§(false);
            §_-Ti§.show();
            return;
         }
         §_-Ti§.§_-b2w§(this.§_-I2R§.location,this.§_-I2R§.number);
         this.reset();
         this.§_-81n§(false);
         this.map.§_-S19§(true,true);
      }
      
      private function §_-41i§(param1:TimerEvent) : void
      {
         §_-k1U§.§_-Z1i§(this.timer.repeatCount - int(param1.currentTarget.currentCount));
      }
      
      private function §_-M1G§(param1:TimerEvent) : void
      {
         this.§_-61A§();
      }
      
      private function §_-73C§(param1:MouseEvent) : void
      {
         this.§_-Fm§ = true;
         this.§_-TJ§.§_-N2E§();
      }
      
      private function §_-B3n§() : int
      {
         return this.§_-63x§.seconds + this.§_-63x§.minutes * 60;
      }
      
      private function §_-y2F§() : void
      {
         this.timer.addEventListener(TimerEvent.TIMER,this.§_-41i§,false,0,true);
         this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.§_-M1G§,false,0,true);
      }
      
      private function §_-027§() : void
      {
         if(this.§_-nW§)
         {
            this.§_-61A§();
         }
         if(!this.§_-HQ§())
         {
            this.§_-RX§();
            return;
         }
         if(§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-Dk§) && this.header.§_-wA§)
         {
            this.§_-h1K§();
         }
         else if(!§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-9F§))
         {
            this.§_-TJ§.§_-H2B§();
            return;
         }
         if(this.§_-6g§())
         {
            return;
         }
         this.§_-h1K§();
      }
      
      private function §_-Z1N§() : void
      {
         this.header.§_-Wy§();
         this.§_-c2l§.§_-Wy§();
         if(!this.map)
         {
            return;
         }
         (this.map as §_-53A§).enabled = true;
      }
      
      private function §_-d2h§() : void
      {
         if(!§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-9F§))
         {
            this.§_-k1c§.location = §_-at§.§_-lg§;
         }
         Connection.§_-e2T§(§_-u1O§.§_-ks§,this.§_-k1c§.mode == §_-at§.§_-dH§ ? §_-at§.§_-n1O§ : this.§_-k1c§.mode,this.§_-k1c§.time,this.§_-k1c§.map);
         if(!§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-Dk§))
         {
            §_-Ti§.§_-O1z§(int(this.§_-k1c§.map),this.§_-k1c§.location,this.§_-k1c§.mode,Game.selfId,this.§_-k1c§.§_-W22§);
         }
         if(§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-Dk§))
         {
            this.header.block();
            this.§_-c2l§.block();
            this.exit();
            return;
         }
         §_-t2c§.show("Location");
      }
      
      private function §_-N1P§() : Point
      {
         if(!this.map)
         {
            return new Point(0,0);
         }
         var _loc1_:Number = (this.map as §_-53A§).scale;
         var _loc2_:int = this.map.size.x > Game.starling.stage.stageWidth ? int(this.shift.x) : int((Game.starling.stage.stageWidth - this.map.size.x * _loc1_) * 0.5);
         var _loc3_:int = this.map.size.y > Game.starling.stage.stageHeight ? int(this.shift.y) : int((Game.starling.stage.stageHeight - this.map.size.y * _loc1_) * 0.5);
         return new Point(Math.max(_loc2_,0),Math.max(_loc3_,0));
      }
      
      private function §_-t1i§() : void
      {
         §_-Ti§.§_-X2b§();
         this.§_-63x§.hide();
         this.§_-LL§.hide();
         if(this.§_-dF§)
         {
            this.§_-dF§.removeAll();
            this.§_-dF§.hide();
         }
         this.§_-TJ§.§_-L15§();
         §_-3H§.§_-Hd§();
         if(this.§_-l1K§.visible)
         {
            this.§_-l1K§.hide();
         }
      }
      
      private function §_-Q8§(param1:Number) : void
      {
         this.squirrels.scaleX = this.squirrels.scaleY = param1;
         var _loc2_:§_-aS§ = this.map.§_-n2B§;
         _loc2_.scaleFlashX = _loc2_.scaleFlashY = param1;
         _loc2_.scaleX = _loc2_.scaleY = param1;
         (this.map as §_-53A§).scale = param1;
         if(!this.cast)
         {
            return;
         }
         this.cast.scaleFlashX = this.cast.scaleFlashY = param1;
         this.cast.scaleX = this.cast.scaleY = param1;
      }
      
      private function §_-33L§() : void
      {
         if(!this.cast)
         {
            return;
         }
         if(Hero.self)
         {
            Hero.self.§_-C2u§(false);
         }
         this.cast.castObject = null;
         §_-a2p§.§_-l16§();
         this.cast.removeFromParent(true);
         this.cast.dispose();
         this.cast = null;
      }
   }
}

