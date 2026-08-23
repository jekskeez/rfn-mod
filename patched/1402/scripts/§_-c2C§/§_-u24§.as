package §_-c2C§
{
   import §_-53r§.§_-Q16§;
   import §_-61C§.§_-a2p§;
   import §_-921§.§_-V1Y§;
   import §_-92r§.§_-B3Y§;
   import §_-92r§.§_-q1D§;
   import §_-I2Y§.§_-91K§;
   import §_-J1i§.§_-k1U§;
   import §_-Mq§.DisplayObjectManager;
   import §_-O1O§.§_-l2E§;
   import §_-TK§.§_-aS§;
   import §_-TK§.§_-zg§;
   import §_-X1k§.§_-4v§;
   import §_-X1k§.§_-82O§;
   import §_-X1k§.§_-Ac§;
   import §_-X1k§.§_-LZ§;
   import §_-X1k§.§_-hO§;
   import §_-X1k§.§_-r12§;
   import §_-X2V§.CastEvent;
   import §_-bN§.§_-TB§;
   import §_-cm§.§_-cV§;
   import §_-o1W§.§_-ye§;
   import §_-q1N§.§_-QM§;
   import §_-r1M§.§_-x1l§;
   import §_-td§.§_-N2w§;
   import §_-td§.§_-vO§;
   import chat.§_-O1y§;
   import chat.§_-g1j§;
   import events.GameEvent;
   import events.§_-Am§;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.utils.Timer;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-43R§;
   import game.mainGame.§_-n2T§;
   import game.mainGame.§_-wf§;
   import protocol.Connection;
   import protocol.§_-n2E§;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   import utils.StringUtil;
   import utils.§_-33I§;
   import views.§_-W2Y§;
   import views.§_-aW§;
   import views.§_-h10§;
   
   public class §_-u24§ extends Screen implements §_-91K§
   {
      
      public static var location:int;
      
      public static var mode:int = 0;
      
      public static var §_-W22§:int = 0;
      
      private static var _instance:§_-u24§ = null;
      
      private static var §_-z2t§:Array = [];
      
      private var §_-V8§:§_-i5§ = null;
      
      private var §_-VU§:Timer = new Timer(1000);
      
      private var §_-2B§:§_-wf§;
      
      private var §_-F2v§:Sprite = new Sprite();
      
      private var §_-c1A§:Sprite = new Sprite();
      
      private var §_-yz§:§_-aS§ = new §_-aS§();
      
      private var §_-C1B§:§_-vO§ = null;
      
      private var isPlaying:Boolean = false;
      
      private var §_-l2T§:Boolean = false;
      
      private var §_-T2W§:§_-i5§ = null;
      
      private var §_-N2f§:int;
      
      private var §_-f1Y§:Boolean = false;
      
      private var §_-c1W§:Boolean = false;
      
      private var §_-H2Y§:Array = [];
      
      private var §_-8C§:int = 0;
      
      private var state:int = -1;
      
      private var §_-q1R§:Array = [];
      
      private var §_-u21§:Boolean = false;
      
      private var §_-j2T§:int = 0;
      
      private var §_-99§:Boolean = false;
      
      public function §_-u24§()
      {
         _instance = this;
         super();
      }
      
      public static function §_-bP§() : void
      {
         if(!_instance)
         {
            return;
         }
         _instance.§_-2B§.§_-f1U§ = new Vector.<int>();
      }
      
      public static function §_-31B§(param1:int) : Boolean
      {
         if(_instance.§_-C1B§ == null)
         {
            return false;
         }
         var _loc2_:Hero = _instance.§_-C1B§.squirrels.get(param1);
         return Boolean(_loc2_) && _loc2_.shaman && !_loc2_.isDead;
      }
      
      public static function §_-sR§(param1:int) : Boolean
      {
         if(_instance.§_-C1B§ == null)
         {
            return false;
         }
         var _loc2_:Hero = _instance.§_-C1B§.squirrels.get(param1);
         return Boolean(_loc2_) && _loc2_.isHare;
      }
      
      public static function §_-bL§(param1:int) : Boolean
      {
         if(_instance.§_-C1B§ == null)
         {
            return false;
         }
         var _loc2_:Hero = _instance.§_-C1B§.squirrels.get(param1);
         return _loc2_ != null;
      }
      
      public static function §_-I2B§(param1:int) : Boolean
      {
         if(_instance.§_-C1B§ == null)
         {
            return false;
         }
         var _loc2_:Hero = _instance.§_-C1B§.squirrels.get(param1);
         return Boolean(_loc2_) && _loc2_.isDead;
      }
      
      public static function §_-ru§(param1:int) : Boolean
      {
         if(_instance.§_-C1B§ == null)
         {
            return false;
         }
         var _loc2_:Hero = _instance.§_-C1B§.squirrels.get(param1);
         return Boolean(_loc2_) && _loc2_.§_-P12§;
      }
      
      public static function §_-M2t§(param1:int) : int
      {
         if(Boolean(_instance && _instance.§_-C1B§) && Boolean(_instance.§_-C1B§.squirrels) && Boolean(_instance.§_-C1B§.squirrels.get(param1)))
         {
            return _instance.§_-C1B§.squirrels.get(param1).team;
         }
         return 0;
      }
      
      public static function get §_-D2U§() : int
      {
         return (_instance.state == §_-s2l§.ROUND_PLAYING || _instance.state == §_-s2l§.ROUND_START) && _instance.§_-VU§.running ? _instance.§_-VU§.currentCount : -1;
      }
      
      public static function get §_-j2T§() : int
      {
         return _instance.§_-j2T§;
      }
      
      public static function start(param1:int, param2:Boolean = false, param3:Boolean = false, param4:int = 0) : void
      {
         if(!_instance.§_-u21§)
         {
            _instance.init();
         }
         §_-W22§ = 0;
         mode = 0;
         _instance.§_-99§ = false;
         _instance.§_-j2T§ = 0;
         if(!_instance.§_-l2T§)
         {
            §_-r12§.§_-73x§(§_-n2E§.§_-T2s§).§_-i2T§(int(Game.§_-ul§));
            §_-kG§.§_-E1U§ = -1;
         }
         if(param3)
         {
            _instance.§_-j2T§ = param1;
            Connection.§_-e2T§(§_-u1O§.§_-H1S§,param1);
            _instance.isPlaying = false;
            return;
         }
         if(!param2 && !§_-hO§.§_-w2n§(param1))
         {
            if(_instance.§_-l2T§)
            {
               §_-t2c§.show(§_-t2c§.§_-di§);
               _instance.§_-l2T§ = false;
            }
            §_-TB§.show(param1);
            _instance.isPlaying = false;
            return;
         }
         if(param2)
         {
            Connection.§_-e2T§(§_-u1O§.§_-M2g§,param1);
         }
         else
         {
            Connection.§_-e2T§(§_-u1O§.§_-NS§,param1,param4);
         }
         location = param1;
         §_-W22§ = param4;
      }
      
      public static function §_-F2z§(param1:int, param2:int) : void
      {
         if(!_instance.§_-u21§)
         {
            _instance.init();
         }
         mode = 0;
         _instance.§_-j2T§ = 0;
         if(!§_-hO§.§_-w2n§(param2))
         {
            §_-TB§.show(param2);
            return;
         }
         §_-r12§.§_-73x§(§_-n2E§.§_-T2s§).§_-i2T§(int(Game.§_-ul§));
         §_-kG§.§_-E1U§ = -1;
         Connection.§_-e2T§(§_-u1O§.§_-i2M§,param1);
         location = param2;
      }
      
      public static function §_-q2C§() : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-hf§);
         §_-r12§.§_-73x§(§_-n2E§.§_-T2s§).§_-i2T§(int(Game.§_-ul§));
         §_-kG§.§_-E1U§ = -1;
         _instance.isPlaying = false;
      }
      
      public static function §_-D4§() : void
      {
         if(_instance.§_-C1B§)
         {
            _instance.§_-C1B§.§_-s2p§();
         }
      }
      
      public static function sendMessage(param1:int, param2:String, param3:int = 0) : void
      {
         §_-O1y§.instance.sendMessage(param1,param2,param3);
      }
      
      public static function §_-b1g§() : void
      {
         _instance.§_-l2T§ = false;
      }
      
      public static function §_-x2I§() : void
      {
         if(_instance.§_-l2T§ && !_instance.isPlaying)
         {
            _instance.§_-l2T§ = false;
            Connection.§_-e2T§(§_-u1O§.§_-hf§);
            §_-t2c§.show(§_-t2c§.§_-di§ is §_-fx§ ? "Location" : §_-t2c§.§_-di§);
            return;
         }
         _instance.§_-l2T§ = false;
         Connection.§_-e2T§(§_-u1O§.§_-M15§);
      }
      
      public static function §_-Wg§() : void
      {
         if(_instance.§_-l2T§)
         {
            return;
         }
         _instance.§_-l2T§ = true;
         Connection.§_-e2T§(§_-u1O§.§_-M15§);
      }
      
      override public function show() : void
      {
         super.show();
         §_-aW§.instance.open();
         §_-p2U§.add("this.squirrelGame - show",location);
         this.§_-Yb§();
         §_-a2p§.§_-f15§(this.§_-BS§);
         §_-O1y§.instance.show();
      }
      
      override public function hide() : void
      {
         super.hide();
         this.clear();
         §_-W2Y§.instance.dispose();
         this.state = -1;
         this.§_-H2Y§ = [];
         GameSounds.stopAll();
         §_-O1y§.instance.§_-9e§();
         if(this.§_-C1B§ != null)
         {
            if(this.§_-yz§.§_-U2E§(this.§_-C1B§))
            {
               this.§_-yz§.removeChildStarling(this.§_-C1B§);
            }
            this.§_-C1B§.dispose();
            this.§_-C1B§ = null;
            §_-Z1D§.§_-y20§(true);
            §_-n2T§.clear();
         }
         §_-LZ§.§_-d1J§();
         §_-4v§.§_-d1J§();
         §_-a2p§.§_-Dg§(this.§_-BS§);
         if(§_-hO§.§_-w2n§(location))
         {
            return;
         }
         §_-TB§.show(location);
      }
      
      private function init() : void
      {
         this.§_-u21§ = true;
         this.§_-2B§ = new §_-wf§();
         this.§_-VU§.addEventListener(TimerEvent.TIMER,this.§_-L2n§);
         this.§_-VU§.addEventListener(TimerEvent.TIMER_COMPLETE,this.§_-O2f§);
         this.§_-yz§.graphics.beginFill(2037527,0);
         this.§_-yz§.graphics.drawRect(0,0,§_-Zy§.§_-21V§,Game.§_-sT§);
         this.§_-yz§.graphics.endFill();
         §_-817§.§_-X2a§.addChild(this.§_-yz§.getStarlingView());
         addChild(this.§_-yz§);
         addChild(new §_-W2Y§());
         addChild(new §_-h10§());
         var _loc1_:DialogBaseBackground = new DialogBaseBackground();
         _loc1_.scaleX = 0.7;
         _loc1_.scaleY = 0.5;
         _loc1_.alpha = 0.5;
         this.§_-F2v§.addChild(_loc1_);
         this.§_-F2v§.visible = false;
         _loc1_ = new DialogBaseBackground();
         _loc1_.scaleX = 0.7;
         _loc1_.scaleY = 0.5;
         _loc1_.alpha = 0.5;
         this.§_-c1A§.addChild(_loc1_);
         this.§_-c1A§.visible = false;
         var _loc2_:§_-i5§ = new §_-i5§(gls("Через             начнется новый раунд и ты присоединишься к другим белкам"),0,0,new TextFormat(null,16,4399364,null,null,null,null,null,"center"));
         _loc2_.width = 210;
         _loc2_.multiline = true;
         _loc2_.wordWrap = true;
         _loc2_.x = int((this.§_-F2v§.width - _loc2_.width) * 0.5);
         _loc2_.y = int((this.§_-F2v§.height - _loc2_.height) * 0.5);
         this.§_-F2v§.addChild(_loc2_);
         this.§_-T2W§ = new §_-i5§(gls("Сейчас на Солнечной Долине ты один. Подожди прихода других белок."),0,0,new TextFormat(null,16,4399364,null,null,null,null,null,"center"));
         this.§_-T2W§.width = 210;
         this.§_-T2W§.multiline = true;
         this.§_-T2W§.wordWrap = true;
         this.§_-T2W§.autoSize = TextFieldAutoSize.CENTER;
         this.§_-T2W§.x = int((this.§_-c1A§.width - this.§_-T2W§.width) * 0.5);
         this.§_-T2W§.y = int((this.§_-c1A§.height - this.§_-T2W§.height) * 0.5);
         this.§_-c1A§.addChild(this.§_-T2W§);
         this.§_-V8§ = new §_-i5§("",_loc2_.x + 76,_loc2_.y,new TextFormat(null,16,1801734,true));
         this.§_-F2v§.addChild(this.§_-V8§);
         this.§_-F2v§.x = 10;
         this.§_-F2v§.y = 50;
         addChild(this.§_-F2v§);
         this.§_-c1A§.x = Game.starling.stage.stageWidth - this.§_-c1A§.width;
         this.§_-c1A§.y = 50;
         addChild(this.§_-c1A§);
         addChild(new §_-O1y§());
         §_-82O§.addEventListener(GameEvent.SEASON_CHANGED,this.§_-k27§);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-o2Z§,§_-s2l§.§_-V1b§,§_-s2l§.§_-p1K§,§_-s2l§.§_-V2o§,§_-s2l§.§_-n1f§,§_-s2l§.§_-v1r§,§_-s2l§.§_-Nb§,§_-s2l§.§_-M2g§,§_-s2l§.§_-N1Y§,§_-s2l§.§_-kF§]);
         §_-73Q§.addEventListener(§_-73Q§.§_-J1D§,this.§_-W1N§);
         §_-zg§.§_-jx§.addEventListener(§_-zg§.§_-O1N§,this.§_-MN§);
      }
      
      private function §_-MN§(param1:Event) : void
      {
         this.§_-f1Y§ = true;
         Connection.§_-e2T§(§_-u1O§.§_-M15§);
      }
      
      private function §_-W1N§(param1:Event) : void
      {
         this.§_-c1A§.x = Game.starling.stage.stageWidth - this.§_-c1A§.width;
      }
      
      private function §_-43C§(param1:int) : void
      {
         if(this.§_-VU§.running && Hero.§_-Cg§)
         {
            §_-B3Y§.instance.§_-lQ§ = param1;
            §_-B3Y§.instance.show();
         }
         this.§_-VU§.stop();
         this.§_-VU§.repeatCount = param1;
         this.§_-VU§.reset();
         this.§_-VU§.start();
      }
      
      private function hollow(param1:int) : void
      {
         if(param1 != Game.selfId)
         {
            return;
         }
         §_-h10§.show();
         if(location != §_-at§.§_-D18§)
         {
            return;
         }
         if(!§_-Ac§.§_-91§(§_-Ac§.§_-w1H§))
         {
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-M15§);
         §_-u24§.§_-b1g§();
      }
      
      private function §_-BS§(param1:§_-Am§) : void
      {
         if(this.§_-C1B§ == null)
         {
            return;
         }
         this.§_-C1B§.cast.§_-ff§(new CastEvent(CastEvent.SELECT,param1.className));
      }
      
      private function §_-13G§(param1:§_-s2l§) : void
      {
         if(_instance.isPlaying)
         {
            return;
         }
         _instance.isPlaying = true;
         if(this.§_-l2T§)
         {
            this.§_-l2T§ = false;
            §_-t2c§.§_-U2Y§(this);
            Connection.§_-e2T§(§_-u1O§.§_-Ea§,§_-u1O§.§_-t1B§);
         }
         location = param1[0];
         §_-W22§ = param1[1];
         this.§_-q1R§ = param1[2];
         if(!§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§ | §_-33I§.§_-AJ§) && location == §_-at§.§_-nq§)
         {
            Connection.§_-e2T§(§_-u1O§.§_-M15§);
         }
         §_-t2c§.show(this);
         §_-k1U§.§_-z1t§(location);
         if(this.§_-C1B§.squirrels is §_-N2w§)
         {
            (this.§_-C1B§.squirrels as §_-N2w§).locationId = location;
         }
         this.§_-uK§();
      }
      
      private function §_-Yb§() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(this.§_-C1B§ != null)
         {
            if(this.§_-C1B§.squirrels is §_-N2w§)
            {
               _loc1_ = (this.§_-C1B§.squirrels as §_-N2w§).§_-e1T§;
               _loc2_ = (this.§_-C1B§.squirrels as §_-N2w§).§_-V3§;
               _loc3_ = int((this.§_-C1B§.squirrels as §_-N2w§).§_-z1M§);
               _loc4_ = (this.§_-C1B§.squirrels as §_-N2w§).§_-72r§;
            }
            if(this.§_-yz§.§_-U2E§(this.§_-C1B§))
            {
               this.§_-yz§.removeChildStarling(this.§_-C1B§);
            }
            this.§_-C1B§.dispose();
            this.§_-C1B§ = null;
         }
         §_-p2U§.add("this.squirrelGame - initSquirrelGame",location);
         switch(location)
         {
            case §_-at§.§_-N2g§:
               this.§_-C1B§ = new §_-cV§();
               break;
            case §_-at§.§_-92b§:
               this.§_-C1B§ = new §_-V1Y§(mode == §_-at§.§_-n1O§);
               break;
            case §_-at§.§_-G1K§:
               switch(mode)
               {
                  case §_-at§.§_-O2n§:
                     this.§_-C1B§ = new §_-ye§();
                     break;
                  case §_-at§.§_-r1j§:
                     this.§_-C1B§ = new §_-Q16§();
                     break;
                  default:
                     this.§_-C1B§ = new §_-vO§();
               }
               break;
            default:
               switch(mode)
               {
                  case §_-at§.§_-n1O§:
                     this.§_-C1B§ = new §_-l2E§();
                     break;
                  case §_-at§.§_-dH§:
                     this.§_-C1B§ = new §_-l2E§(true);
                     break;
                  case §_-at§.§_-83q§:
                     this.§_-C1B§ = new §_-x1l§();
                     break;
                  case §_-at§.§_-F15§:
                     this.§_-C1B§ = new §_-QM§();
                     break;
                  default:
                     this.§_-C1B§ = new §_-vO§();
               }
         }
         this.§_-C1B§.§_-T1y§ = mode == §_-at§.§_-Tj§;
         this.§_-R1k§();
         this.§_-yz§.addChild(this.§_-C1B§);
         this.§_-yz§.§_-J2J§(this.§_-C1B§);
         if(this.§_-C1B§.squirrels is §_-N2w§)
         {
            (this.§_-C1B§.squirrels as §_-N2w§).locationId = location;
            (this.§_-C1B§.squirrels as §_-N2w§).§_-e1T§ = _loc1_;
            (this.§_-C1B§.squirrels as §_-N2w§).§_-V3§ = _loc2_;
            (this.§_-C1B§.squirrels as §_-N2w§).§_-z1M§ = _loc3_;
            (this.§_-C1B§.squirrels as §_-N2w§).§_-72r§ = _loc4_;
         }
         this.§_-uK§();
      }
      
      private function §_-R1k§() : void
      {
         switch(location)
         {
            case §_-at§.§_-I6§:
            case §_-at§.§_-B2t§:
            case §_-at§.§_-D18§:
            case §_-at§.§_-N2g§:
               this.§_-C1B§.§_-w2g§ = SquirrelGame.§_-e2e§;
         }
      }
      
      private function §_-uK§() : void
      {
         if(§_-u24§.§_-j2T§ != 0)
         {
            if(this.§_-C1B§.squirrels is §_-N2w§)
            {
               (this.§_-C1B§.squirrels as §_-N2w§).set(this.§_-q1R§.slice());
            }
            else
            {
               this.§_-C1B§.squirrels.set(this.§_-q1R§);
            }
            this.§_-C1B§.squirrels.hide();
            this.§_-e1W§ = this.§_-q1R§.length;
            return;
         }
         if(this.§_-C1B§.squirrels is §_-N2w§)
         {
            this.§_-q1R§.push(Game.selfId);
            (this.§_-C1B§.squirrels as §_-N2w§).set(this.§_-q1R§);
         }
         else
         {
            this.§_-C1B§.squirrels.set(this.§_-q1R§);
            this.§_-C1B§.squirrels.add(Game.selfId);
         }
         this.§_-C1B§.squirrels.hide();
         this.§_-e1W§ = this.§_-q1R§.length;
      }
      
      private function round(param1:Array) : void
      {
         if(!this.§_-C1B§)
         {
            this.§_-f1Y§ = true;
            Connection.§_-e2T§(§_-u1O§.§_-M15§);
            return;
         }
         this.state = param1[0];
         if(this.state == §_-s2l§.§_-02x§ && this.§_-99§)
         {
            Connection.§_-e2T§(§_-u1O§.§_-M15§);
            return;
         }
         if(this.state != §_-s2l§.§_-F2f§ && this.§_-c1W§)
         {
            §_-Mf§.§_-Mm§(this.§_-8C§);
         }
         var _loc2_:int = "1" in param1 ? int(param1[1]) : 0;
         if(this.state == §_-s2l§.ROUND_START)
         {
            if(§_-z2t§.indexOf(this.§_-8C§) == -1)
            {
               §_-z2t§.push(this.§_-8C§);
            }
            else
            {
               Connection.§_-e2T§(§_-u1O§.§_-Ea§,§_-u1O§.§_-ml§,location);
            }
         }
         this.§_-8C§ = "2" in param1 ? int(param1[2]) : this.§_-8C§;
         var _loc3_:int = "3" in param1 ? int(param1[3]) : mode;
         if(mode != _loc3_)
         {
            mode = _loc3_;
            this.§_-Yb§();
         }
         this.§_-VU§.stop();
         this.§_-C1B§.round(param1);
         §_-k1U§.§_-a1r§(this.§_-8C§);
         if(this.state == §_-s2l§.§_-F2f§)
         {
            this.§_-43C§(_loc2_);
            return;
         }
         §_-B3Y§.instance.hide(null);
         this.§_-F2v§.visible = false;
         §_-k1U§.clear();
         this.setFocus();
         this.§_-P1E§(this.state == §_-s2l§.ROUND_WAITING);
         §_-O1y§.instance.visible = this.state != §_-s2l§.ROUND_STARTING;
         switch(this.state)
         {
            case §_-s2l§.ROUND_WAITING:
               §_-k1U§.§_-yA§(this.§_-C1B§.squirrels.§_-n2K§());
               this.§_-F2A§(_loc2_);
               break;
            case §_-s2l§.ROUND_STARTING:
               if(§_-p2U§.§_-i10§)
               {
                  DisplayObjectManager.getInstance().length;
               }
               this.§_-F2A§(_loc2_);
               §_-q1D§.show();
               break;
            case §_-s2l§.ROUND_PLAYING:
               this.§_-F2v§.visible = true;
               this.§_-t1U§(_loc2_);
               this.§_-s2A§(this.§_-C1B§.squirrels.§_-n2K§());
               if(§_-at§.§_-13l§(location).teamMode)
               {
                  §_-k1U§.§_-RB§((this.§_-C1B§.squirrels as §_-43R§).§_-WO§,(this.§_-C1B§.squirrels as §_-43R§).§_-Z2D§);
               }
               else
               {
                  §_-k1U§.§_-yA§(this.§_-C1B§.squirrels.§_-n2K§());
               }
               break;
            case §_-s2l§.ROUND_START:
               §_-Mf§.§_-81y§();
               §_-Z1D§.§_-y20§();
               §_-h10§.hide();
               this.§_-c1W§ = true;
               this.§_-t1U§(_loc2_);
               this.§_-T2I§(this.§_-C1B§.squirrels.§_-n2K§());
               if(§_-at§.§_-13l§(location).teamMode)
               {
                  §_-k1U§.§_-RB§((this.§_-C1B§.squirrels as §_-43R§).§_-WO§,(this.§_-C1B§.squirrels as §_-43R§).§_-Z2D§);
               }
               else
               {
                  §_-k1U§.§_-yA§(this.§_-C1B§.squirrels.§_-n2K§());
               }
         }
      }
      
      private function §_-T2I§(param1:Array) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-H2Y§.length)
         {
            if(param1.indexOf(this.§_-H2Y§[_loc2_]) == -1)
            {
               this.§_-H2Y§.splice(_loc2_,1);
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            if(!(Game.§_-82§.indexOf(param1[_loc2_]) == -1 && !Game.§_-t2I§(param1[_loc2_])))
            {
               if(this.§_-H2Y§.indexOf(param1[_loc2_]) == -1)
               {
                  §_-O1y§.instance.sendMessage(param1[_loc2_],"",§_-g1j§.§_-42f§);
                  this.§_-H2Y§.push(param1[_loc2_]);
               }
            }
            _loc2_++;
         }
      }
      
      private function §_-s2A§(param1:Array) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            if(!(Game.§_-82§.indexOf(param1[_loc2_]) == -1 && !Game.§_-t2I§(param1[_loc2_])))
            {
               if(this.§_-H2Y§.indexOf(param1[_loc2_]) == -1)
               {
                  §_-O1y§.instance.sendMessage(param1[_loc2_],"",§_-g1j§.§_-A3O§);
               }
            }
            _loc2_++;
         }
      }
      
      private function §_-c2U§(param1:int) : void
      {
         if(Game.§_-t2I§(param1) || Game.§_-82§.indexOf(param1) != -1)
         {
            §_-O1y§.instance.sendMessage(param1,"",§_-g1j§.§_-a9§);
         }
      }
      
      private function setFocus() : void
      {
         if(Game.chat.hasFocus())
         {
            return;
         }
         Game.stage.focus = Game.stage;
      }
      
      private function §_-P1E§(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         this.clear();
         this.§_-c1A§.visible = param1;
         if(!param1)
         {
            return;
         }
         switch(location)
         {
            case §_-at§.§_-I6§:
            case §_-at§.§_-B2t§:
               this.§_-T2W§.text = gls("Сейчас на Солнечной Долине ты один. Подожди прихода других белок.");
               break;
            case §_-at§.§_-D18§:
               this.§_-T2W§.text = gls("Сейчас на Топях ты один. Подожди прихода других белок.");
               break;
            case §_-at§.§_-92b§:
               this.§_-T2W§.text = gls("Сейчас в Пустыне ты один. Подожди прихода других белок.");
               break;
            case §_-at§.§_-j1i§:
               this.§_-T2W§.text = gls("Сейчас в Аномальной зоне ты один. Подожди прихода других белок.");
               break;
            case §_-at§.§_-e2a§:
               this.§_-T2W§.text = gls("Сейчас на Испытании ты один. Подожди прихода других белок.");
               break;
            case §_-at§.§_-N2g§:
               _loc2_ = §_-at§.§_-M21§ - this.§_-e1W§ + 1;
               this.§_-T2W§.text = _loc2_ > 0 ? gls("Для начала новой Битвы нужно подождать еще {0} {1}.",_loc2_,StringUtil.word("белка",_loc2_)) : "\n" + gls("Игра скоро начнется");
               break;
            case §_-at§.§_-U1s§:
               this.§_-T2W§.text = gls("Для начала игры в Шторме не хватает игроков");
               break;
            case §_-at§.§_-G1K§:
               this.§_-T2W§.text = gls("Сейчас на Диких Землях ты один. Подожди прихода других белок.");
         }
      }
      
      private function §_-q10§() : void
      {
         this.§_-f1Y§ = false;
         this.isPlaying = false;
         Game.chat.hide();
         this.§_-VU§.stop();
         Connection.§_-e2T§(§_-u1O§.§_-Ea§,§_-u1O§.§_-J1X§,this.§_-l2T§);
         if(!this.§_-l2T§)
         {
            §_-t2c§.show(§_-t2c§.§_-di§ is §_-fx§ ? "Location" : §_-t2c§.§_-di§);
         }
         else
         {
            start(location,false,false,§_-W22§);
         }
         if(!this.§_-c1W§)
         {
            return;
         }
         this.§_-c1W§ = false;
         §_-Mf§.§_-Mm§(this.§_-8C§);
      }
      
      private function §_-F2A§(param1:int) : void
      {
         §_-W2Y§.instance.show(param1);
      }
      
      private function §_-L2n§(param1:TimerEvent) : void
      {
         this.§_-t1W§(this.§_-VU§.repeatCount - param1.currentTarget.currentCount);
      }
      
      private function §_-O2f§(param1:Event) : void
      {
         §_-k1U§.clear();
      }
      
      private function §_-t1W§(param1:int) : void
      {
         §_-k1U§.§_-Z1i§(param1);
         this.§_-V8§.text = §_-k1U§.getTime();
      }
      
      private function get §_-e1W§() : int
      {
         return this.§_-N2f§;
      }
      
      private function set §_-e1W§(param1:int) : void
      {
         if(this.§_-N2f§ == param1)
         {
            return;
         }
         this.§_-N2f§ = param1;
         if(!§_-at§.§_-13l§(location).teamMode && (this.state == §_-s2l§.ROUND_START || this.state == §_-s2l§.ROUND_PLAYING))
         {
            §_-k1U§.§_-yA§(this.§_-C1B§.squirrels.§_-n2K§());
         }
         if(this.state != §_-s2l§.ROUND_WAITING)
         {
            return;
         }
         this.§_-P1E§(true);
         §_-k1U§.§_-yA§(this.§_-C1B§.squirrels.§_-n2K§());
      }
      
      private function §_-t1U§(param1:int) : void
      {
         this.clear();
         this.§_-VU§.repeatCount = param1;
         this.§_-VU§.reset();
         this.§_-VU§.start();
         this.§_-2B§.§_-22r§();
         this.§_-t1W§(param1);
         GameSounds.play("round_begin");
      }
      
      private function clear() : void
      {
         §_-W2Y§.instance.hide();
         §_-k1U§.clear();
         §_-q1D§.hide();
      }
      
      private function §_-A17§(param1:int) : Hero
      {
         if(this.§_-C1B§ == null)
         {
            return null;
         }
         return this.§_-C1B§.squirrels.get(param1);
      }
      
      private function §_-k27§(param1:GameEvent) : void
      {
         this.§_-99§ = true;
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         var _loc4_:Hero = null;
         var _loc5_:Hero = null;
         if(this.§_-f1Y§ && param1.type != §_-s2l§.§_-V1b§)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-s2l§.§_-o2Z§:
               this.§_-13G§(param1);
               break;
            case §_-s2l§.§_-V1b§:
               _loc2_ = this.§_-q1R§.indexOf(param1[0]);
               if(_loc2_ != -1)
               {
                  this.§_-q1R§.splice(_loc2_,1);
               }
               if(param1[0] == Game.selfId)
               {
                  this.§_-q10§();
               }
               --this.§_-e1W§;
               §_-Mf§.§_-1O§();
               break;
            case §_-s2l§.§_-p1K§:
               this.round(param1);
               break;
            case §_-s2l§.§_-V2o§:
               if(this.§_-q1R§.indexOf(param1[0]) == -1)
               {
                  this.§_-q1R§.push(param1[0]);
               }
               if(this.state == §_-s2l§.ROUND_PLAYING || this.state == §_-s2l§.ROUND_START)
               {
                  this.§_-c2U§(param1[0]);
               }
               ++this.§_-e1W§;
               break;
            case §_-s2l§.§_-n1f§:
               if(param1[0] == 1)
               {
                  return;
               }
               this.hollow(param1[1]);
               if(param1[1] == Game.selfId)
               {
                  §_-Mf§.§_-1O§();
                  §_-B3Y§.instance.hide(null);
               }
               break;
            case §_-s2l§.§_-v1r§:
               if(!(§_-t2c§.active is §_-u24§) || param1[0] != Game.selfId)
               {
                  return;
               }
               §_-B3Y§.instance.hide(null);
               break;
            case §_-s2l§.§_-Nb§:
               if(!(§_-t2c§.active is §_-u24§))
               {
                  return;
               }
               if(param1[0] != §_-u1O§.§_-R2M§)
               {
                  return;
               }
               if(§_-u1T§.§_-P1f§(param1[1]))
               {
                  break;
               }
               _loc3_ = §_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§ | §_-33I§.§_-AJ§) ? param1[2] : §_-Qw§.§_-73w§(StringUtil.§_-U2s§(param1[2]));
               _loc4_ = this.§_-A17§(param1[1]);
               if(Boolean(_loc4_) && !_loc4_.isDead)
               {
                  _loc4_.heroView.sendMessage(_loc3_);
               }
               §_-u24§.sendMessage(param1[1],_loc3_,param1[0]);
               if(param1[1] != Game.self.id)
               {
                  GameSounds.play("message_recieve");
               }
               break;
            case §_-s2l§.§_-M2g§:
               this.isPlaying = false;
               break;
            case §_-s2l§.§_-kF§:
               _loc5_ = this.§_-A17§(param1[0]);
               if(!_loc5_)
               {
                  return;
               }
               _loc5_.heroView.§_-YN§(param1[2],param1[1]);
         }
      }
   }
}

