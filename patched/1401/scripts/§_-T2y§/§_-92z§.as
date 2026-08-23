package §_-T2y§
{
   import §_-1T§.DisplayObjectManager;
   import §_-43w§.§_-2t§;
   import §_-8I§.CastEvent;
   import §_-A2x§.§_-33A§;
   import §_-A2x§.§_-Ar§;
   import §_-C3e§.§_-03e§;
   import §_-C3e§.§_-g1H§;
   import §_-F19§.§_-l0§;
   import §_-I10§.§_-13r§;
   import §_-I10§.§_-Bm§;
   import §_-I10§.§_-Q2v§;
   import §_-I10§.§_-Z1F§;
   import §_-I10§.§_-ct§;
   import §_-I10§.§_-d2x§;
   import §_-RI§.§_-52F§;
   import §_-RI§.§_-h2I§;
   import §_-S1D§.§_-O1M§;
   import §_-T1r§.§_-b1U§;
   import §_-TX§.§_-E2Y§;
   import §_-Y22§.§_-E1J§;
   import §_-e2w§.§_-52p§;
   import §_-k1c§.§_-t1I§;
   import §_-p1g§.§_-024§;
   import §_-qJ§.§_-20§;
   import §_-u1f§.§_-21r§;
   import chat.§_-A1n§;
   import chat.§_-r0§;
   import events.GameEvent;
   import events.§_-55§;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.utils.Timer;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-ME§;
   import game.mainGame.§_-c16§;
   import game.mainGame.§_-w2F§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-T2o§;
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   import utils.StringUtil;
   import utils.§_-c10§;
   import views.§_-S2m§;
   import views.§_-Vm§;
   import views.§_-mQ§;
   
   public class §_-92z§ extends Screen implements §_-E1J§
   {
      
      public static var location:int;
      
      public static var mode:int = 0;
      
      public static var §_-H26§:int = 0;
      
      private static var _instance:§_-92z§ = null;
      
      private static var §_-J2c§:Array = [];
      
      private var §_-w2Y§:§_-22V§ = null;
      
      private var §_-o2H§:Timer = new Timer(1000);
      
      private var §_-nb§:§_-c16§;
      
      private var §_-92f§:Sprite = new Sprite();
      
      private var §_-lr§:Sprite = new Sprite();
      
      private var §_-b2n§:§_-h2I§ = new §_-h2I§();
      
      private var §_-i13§:§_-Ar§ = null;
      
      private var isPlaying:Boolean = false;
      
      private var §_-M3§:Boolean = false;
      
      private var §_-rP§:§_-22V§ = null;
      
      private var §_-6b§:int;
      
      private var §_-P1P§:Boolean = false;
      
      private var §_-KU§:Boolean = false;
      
      private var §_-wU§:Array = [];
      
      private var §_-Q1e§:int = 0;
      
      private var state:int = -1;
      
      private var §_-6h§:Array = [];
      
      private var §_-P20§:Boolean = false;
      
      private var §_-32S§:int = 0;
      
      private var §_-d2f§:Boolean = false;
      
      public function §_-92z§()
      {
         _instance = this;
         super();
      }
      
      public static function §_-z2U§() : void
      {
         if(!_instance)
         {
            return;
         }
         _instance.§_-nb§.§_-f2W§ = new Vector.<int>();
      }
      
      public static function §_-81f§(param1:int) : Boolean
      {
         if(_instance.§_-i13§ == null)
         {
            return false;
         }
         var _loc2_:Hero = _instance.§_-i13§.squirrels.get(param1);
         return Boolean(_loc2_) && _loc2_.shaman && !_loc2_.isDead;
      }
      
      public static function §_-F2E§(param1:int) : Boolean
      {
         if(_instance.§_-i13§ == null)
         {
            return false;
         }
         var _loc2_:Hero = _instance.§_-i13§.squirrels.get(param1);
         return Boolean(_loc2_) && _loc2_.isHare;
      }
      
      public static function §_-O21§(param1:int) : Boolean
      {
         if(_instance.§_-i13§ == null)
         {
            return false;
         }
         var _loc2_:Hero = _instance.§_-i13§.squirrels.get(param1);
         return _loc2_ != null;
      }
      
      public static function §_-T1l§(param1:int) : Boolean
      {
         if(_instance.§_-i13§ == null)
         {
            return false;
         }
         var _loc2_:Hero = _instance.§_-i13§.squirrels.get(param1);
         return Boolean(_loc2_) && _loc2_.isDead;
      }
      
      public static function §_-x2u§(param1:int) : Boolean
      {
         if(_instance.§_-i13§ == null)
         {
            return false;
         }
         var _loc2_:Hero = _instance.§_-i13§.squirrels.get(param1);
         return Boolean(_loc2_) && _loc2_.§_-S1K§;
      }
      
      public static function §_-WW§(param1:int) : int
      {
         if(Boolean(_instance && _instance.§_-i13§) && Boolean(_instance.§_-i13§.squirrels) && Boolean(_instance.§_-i13§.squirrels.get(param1)))
         {
            return _instance.§_-i13§.squirrels.get(param1).team;
         }
         return 0;
      }
      
      public static function get §_-E2B§() : int
      {
         return (_instance.state == §_-S2I§.ROUND_PLAYING || _instance.state == §_-S2I§.ROUND_START) && _instance.§_-o2H§.running ? _instance.§_-o2H§.currentCount : -1;
      }
      
      public static function get §_-32S§() : int
      {
         return _instance.§_-32S§;
      }
      
      public static function start(param1:int, param2:Boolean = false, param3:Boolean = false, param4:int = 0) : void
      {
         if(!_instance.§_-P20§)
         {
            _instance.init();
         }
         §_-H26§ = 0;
         mode = 0;
         _instance.§_-d2f§ = false;
         _instance.§_-32S§ = 0;
         if(!_instance.§_-M3§)
         {
            §_-Bm§.§_-z1M§(§_-T2o§.§_-T1J§).§_-r1g§(int(Game.§_-v4§));
            §_-R1c§.§_-D1D§ = -1;
         }
         if(param3)
         {
            _instance.§_-32S§ = param1;
            Connection.§_-Li§(§_-h2B§.§_-U2f§,param1);
            _instance.isPlaying = false;
            return;
         }
         if(!param2 && !§_-Z1F§.§_-92p§(param1))
         {
            if(_instance.§_-M3§)
            {
               §_-71o§.show(§_-71o§.§_-n2M§);
               _instance.§_-M3§ = false;
            }
            §_-t1I§.show(param1);
            _instance.isPlaying = false;
            return;
         }
         if(param2)
         {
            Connection.§_-Li§(§_-h2B§.§_-9L§,param1);
         }
         else
         {
            Connection.§_-Li§(§_-h2B§.§_-yF§,param1,param4);
         }
         location = param1;
         §_-H26§ = param4;
      }
      
      public static function §_-L21§(param1:int, param2:int) : void
      {
         if(!_instance.§_-P20§)
         {
            _instance.init();
         }
         mode = 0;
         _instance.§_-32S§ = 0;
         if(!§_-Z1F§.§_-92p§(param2))
         {
            §_-t1I§.show(param2);
            return;
         }
         §_-Bm§.§_-z1M§(§_-T2o§.§_-T1J§).§_-r1g§(int(Game.§_-v4§));
         §_-R1c§.§_-D1D§ = -1;
         Connection.§_-Li§(§_-h2B§.§_-Wp§,param1);
         location = param2;
      }
      
      public static function §_-U17§() : void
      {
         Connection.§_-Li§(§_-h2B§.§_-So§);
         §_-Bm§.§_-z1M§(§_-T2o§.§_-T1J§).§_-r1g§(int(Game.§_-v4§));
         §_-R1c§.§_-D1D§ = -1;
         _instance.isPlaying = false;
      }
      
      public static function §_-72R§() : void
      {
         if(_instance.§_-i13§)
         {
            _instance.§_-i13§.§_-vw§();
         }
      }
      
      public static function sendMessage(param1:int, param2:String, param3:int = 0) : void
      {
         §_-r0§.instance.sendMessage(param1,param2,param3);
      }
      
      public static function §_-H2p§() : void
      {
         _instance.§_-M3§ = false;
      }
      
      public static function §_-j1q§() : void
      {
         if(_instance.§_-M3§ && !_instance.isPlaying)
         {
            _instance.§_-M3§ = false;
            Connection.§_-Li§(§_-h2B§.§_-So§);
            §_-71o§.show(§_-71o§.§_-n2M§ is §_-w17§ ? "Location" : §_-71o§.§_-n2M§);
            return;
         }
         _instance.§_-M3§ = false;
         Connection.§_-Li§(§_-h2B§.§_-n1x§);
      }
      
      public static function §_-V2l§() : void
      {
         if(_instance.§_-M3§)
         {
            return;
         }
         _instance.§_-M3§ = true;
         Connection.§_-Li§(§_-h2B§.§_-n1x§);
      }
      
      override public function show() : void
      {
         super.show();
         §_-Vm§.instance.open();
         §_-TQ§.add("this.squirrelGame - show",location);
         this.§_-s2V§();
         §_-O1M§.§_-C6§(this.§_-S2Z§);
         §_-r0§.instance.show();
      }
      
      override public function hide() : void
      {
         super.hide();
         this.clear();
         §_-S2m§.instance.dispose();
         this.state = -1;
         this.§_-wU§ = [];
         GameSounds.stopAll();
         §_-r0§.instance.§_-52u§();
         if(this.§_-i13§ != null)
         {
            if(this.§_-b2n§.§_-ws§(this.§_-i13§))
            {
               this.§_-b2n§.removeChildStarling(this.§_-i13§);
            }
            this.§_-i13§.dispose();
            this.§_-i13§ = null;
            §_-Ey§.§_-51M§(true);
            §_-w2F§.clear();
         }
         §_-d2x§.§_-Yp§();
         §_-ct§.§_-Yp§();
         §_-O1M§.§_-L2u§(this.§_-S2Z§);
         if(§_-Z1F§.§_-92p§(location))
         {
            return;
         }
         §_-t1I§.show(location);
      }
      
      private function init() : void
      {
         this.§_-P20§ = true;
         this.§_-nb§ = new §_-c16§();
         this.§_-o2H§.addEventListener(TimerEvent.TIMER,this.§_-5h§);
         this.§_-o2H§.addEventListener(TimerEvent.TIMER_COMPLETE,this.§_-Tc§);
         this.§_-b2n§.graphics.beginFill(2037527,0);
         this.§_-b2n§.graphics.drawRect(0,0,§_-a9§.§_-9o§,Game.§_-s2q§);
         this.§_-b2n§.graphics.endFill();
         §_-s1i§.§_-831§.addChild(this.§_-b2n§.getStarlingView());
         addChild(this.§_-b2n§);
         addChild(new §_-S2m§());
         addChild(new §_-mQ§());
         var _loc1_:DialogBaseBackground = new DialogBaseBackground();
         _loc1_.scaleX = 0.7;
         _loc1_.scaleY = 0.5;
         _loc1_.alpha = 0.5;
         this.§_-92f§.addChild(_loc1_);
         this.§_-92f§.visible = false;
         _loc1_ = new DialogBaseBackground();
         _loc1_.scaleX = 0.7;
         _loc1_.scaleY = 0.5;
         _loc1_.alpha = 0.5;
         this.§_-lr§.addChild(_loc1_);
         this.§_-lr§.visible = false;
         var _loc2_:§_-22V§ = new §_-22V§(gls("Через             начнется новый раунд и ты присоединишься к другим белкам"),0,0,new TextFormat(null,16,4399364,null,null,null,null,null,"center"));
         _loc2_.width = 210;
         _loc2_.multiline = true;
         _loc2_.wordWrap = true;
         _loc2_.x = int((this.§_-92f§.width - _loc2_.width) * 0.5);
         _loc2_.y = int((this.§_-92f§.height - _loc2_.height) * 0.5);
         this.§_-92f§.addChild(_loc2_);
         this.§_-rP§ = new §_-22V§(gls("Сейчас на Солнечной Долине ты один. Подожди прихода других белок."),0,0,new TextFormat(null,16,4399364,null,null,null,null,null,"center"));
         this.§_-rP§.width = 210;
         this.§_-rP§.multiline = true;
         this.§_-rP§.wordWrap = true;
         this.§_-rP§.autoSize = TextFieldAutoSize.CENTER;
         this.§_-rP§.x = int((this.§_-lr§.width - this.§_-rP§.width) * 0.5);
         this.§_-rP§.y = int((this.§_-lr§.height - this.§_-rP§.height) * 0.5);
         this.§_-lr§.addChild(this.§_-rP§);
         this.§_-w2Y§ = new §_-22V§("",_loc2_.x + 76,_loc2_.y,new TextFormat(null,16,1801734,true));
         this.§_-92f§.addChild(this.§_-w2Y§);
         this.§_-92f§.x = 10;
         this.§_-92f§.y = 50;
         addChild(this.§_-92f§);
         this.§_-lr§.x = Game.starling.stage.stageWidth - this.§_-lr§.width;
         this.§_-lr§.y = 50;
         addChild(this.§_-lr§);
         addChild(new §_-r0§());
         §_-13r§.addEventListener(GameEvent.SEASON_CHANGED,this.§_-FM§);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-Hk§,§_-S2I§.§_-R28§,§_-S2I§.§_-W1O§,§_-S2I§.§_-e1h§,§_-S2I§.§_-Vs§,§_-S2I§.§_-F2m§,§_-S2I§.§_-aR§,§_-S2I§.§_-9L§,§_-S2I§.§_-03G§,§_-S2I§.§_-63o§]);
         §_-K1r§.addEventListener(§_-K1r§.§_-n2V§,this.§_-A3q§);
         §_-52F§.§_-u1o§.addEventListener(§_-52F§.§_-g1V§,this.§_-Tl§);
      }
      
      private function §_-Tl§(param1:Event) : void
      {
         this.§_-P1P§ = true;
         Connection.§_-Li§(§_-h2B§.§_-n1x§);
      }
      
      private function §_-A3q§(param1:Event) : void
      {
         this.§_-lr§.x = Game.starling.stage.stageWidth - this.§_-lr§.width;
      }
      
      private function §_-X1C§(param1:int) : void
      {
         if(this.§_-o2H§.running && Hero.§_-6g§)
         {
            §_-03e§.instance.§_-un§ = param1;
            §_-03e§.instance.show();
         }
         this.§_-o2H§.stop();
         this.§_-o2H§.repeatCount = param1;
         this.§_-o2H§.reset();
         this.§_-o2H§.start();
      }
      
      private function hollow(param1:int) : void
      {
         if(param1 != Game.selfId)
         {
            return;
         }
         §_-mQ§.show();
         if(location != §_-q1p§.§_-sL§)
         {
            return;
         }
         if(!§_-Q2v§.§_-S2y§(§_-Q2v§.§_-fh§))
         {
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-n1x§);
         §_-92z§.§_-H2p§();
      }
      
      private function §_-S2Z§(param1:§_-55§) : void
      {
         if(this.§_-i13§ == null)
         {
            return;
         }
         this.§_-i13§.cast.§_-52I§(new CastEvent(CastEvent.SELECT,param1.className));
      }
      
      private function §_-62J§(param1:§_-S2I§) : void
      {
         if(_instance.isPlaying)
         {
            return;
         }
         _instance.isPlaying = true;
         if(this.§_-M3§)
         {
            this.§_-M3§ = false;
            §_-71o§.§_-Sl§(this);
            Connection.§_-Li§(§_-h2B§.§_-U1o§,§_-h2B§.§_-O1G§);
         }
         location = param1[0];
         §_-H26§ = param1[1];
         this.§_-6h§ = param1[2];
         if(!§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§ | §_-c10§.§_-639§) && location == §_-q1p§.§_-427§)
         {
            Connection.§_-Li§(§_-h2B§.§_-n1x§);
         }
         §_-71o§.show(this);
         §_-52p§.§_-g19§(location);
         if(this.§_-i13§.squirrels is §_-33A§)
         {
            (this.§_-i13§.squirrels as §_-33A§).locationId = location;
         }
         this.§_-J1u§();
      }
      
      private function §_-s2V§() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(this.§_-i13§ != null)
         {
            if(this.§_-i13§.squirrels is §_-33A§)
            {
               _loc1_ = (this.§_-i13§.squirrels as §_-33A§).§_-p1d§;
               _loc2_ = (this.§_-i13§.squirrels as §_-33A§).§_-Bo§;
               _loc3_ = int((this.§_-i13§.squirrels as §_-33A§).§_-Pn§);
               _loc4_ = (this.§_-i13§.squirrels as §_-33A§).§_-31S§;
            }
            if(this.§_-b2n§.§_-ws§(this.§_-i13§))
            {
               this.§_-b2n§.removeChildStarling(this.§_-i13§);
            }
            this.§_-i13§.dispose();
            this.§_-i13§ = null;
         }
         §_-TQ§.add("this.squirrelGame - initSquirrelGame",location);
         switch(location)
         {
            case §_-q1p§.§_-M1m§:
               this.§_-i13§ = new §_-b1U§();
               break;
            case §_-q1p§.§_-P4§:
               this.§_-i13§ = new §_-20§(mode == §_-q1p§.§_-h2d§);
               break;
            case §_-q1p§.§_-k2B§:
               switch(mode)
               {
                  case §_-q1p§.§_-lZ§:
                     this.§_-i13§ = new §_-E2Y§();
                     break;
                  case §_-q1p§.§_-ri§:
                     this.§_-i13§ = new §_-21r§();
                     break;
                  default:
                     this.§_-i13§ = new §_-Ar§();
               }
               break;
            default:
               switch(mode)
               {
                  case §_-q1p§.§_-h2d§:
                     this.§_-i13§ = new §_-l0§();
                     break;
                  case §_-q1p§.§_-3F§:
                     this.§_-i13§ = new §_-l0§(true);
                     break;
                  case §_-q1p§.§_-l1M§:
                     this.§_-i13§ = new §_-024§();
                     break;
                  case §_-q1p§.§_-w1Y§:
                     this.§_-i13§ = new §_-2t§();
                     break;
                  default:
                     this.§_-i13§ = new §_-Ar§();
               }
         }
         this.§_-i13§.§_-1q§ = mode == §_-q1p§.§_-cq§;
         this.§_-K2j§();
         this.§_-b2n§.addChild(this.§_-i13§);
         this.§_-b2n§.§_-83v§(this.§_-i13§);
         if(this.§_-i13§.squirrels is §_-33A§)
         {
            (this.§_-i13§.squirrels as §_-33A§).locationId = location;
            (this.§_-i13§.squirrels as §_-33A§).§_-p1d§ = _loc1_;
            (this.§_-i13§.squirrels as §_-33A§).§_-Bo§ = _loc2_;
            (this.§_-i13§.squirrels as §_-33A§).§_-Pn§ = _loc3_;
            (this.§_-i13§.squirrels as §_-33A§).§_-31S§ = _loc4_;
         }
         this.§_-J1u§();
      }
      
      private function §_-K2j§() : void
      {
         switch(location)
         {
            case §_-q1p§.§_-C25§:
            case §_-q1p§.§_-X1n§:
            case §_-q1p§.§_-sL§:
            case §_-q1p§.§_-M1m§:
               this.§_-i13§.§_-G2k§ = SquirrelGame.§_-DF§;
         }
      }
      
      private function §_-J1u§() : void
      {
         if(§_-92z§.§_-32S§ != 0)
         {
            if(this.§_-i13§.squirrels is §_-33A§)
            {
               (this.§_-i13§.squirrels as §_-33A§).set(this.§_-6h§.slice());
            }
            else
            {
               this.§_-i13§.squirrels.set(this.§_-6h§);
            }
            this.§_-i13§.squirrels.hide();
            this.§_-I1y§ = this.§_-6h§.length;
            return;
         }
         if(this.§_-i13§.squirrels is §_-33A§)
         {
            this.§_-6h§.push(Game.selfId);
            (this.§_-i13§.squirrels as §_-33A§).set(this.§_-6h§);
         }
         else
         {
            this.§_-i13§.squirrels.set(this.§_-6h§);
            this.§_-i13§.squirrels.add(Game.selfId);
         }
         this.§_-i13§.squirrels.hide();
         this.§_-I1y§ = this.§_-6h§.length;
      }
      
      private function round(param1:Array) : void
      {
         if(!this.§_-i13§)
         {
            this.§_-P1P§ = true;
            Connection.§_-Li§(§_-h2B§.§_-n1x§);
            return;
         }
         this.state = param1[0];
         if(this.state == §_-S2I§.§_-RO§ && this.§_-d2f§)
         {
            Connection.§_-Li§(§_-h2B§.§_-n1x§);
            return;
         }
         if(this.state != §_-S2I§.§_-JF§ && this.§_-KU§)
         {
            §_-t1V§.§_-z1W§(this.§_-Q1e§);
         }
         var _loc2_:int = "1" in param1 ? int(param1[1]) : 0;
         if(this.state == §_-S2I§.ROUND_START)
         {
            if(§_-J2c§.indexOf(this.§_-Q1e§) == -1)
            {
               §_-J2c§.push(this.§_-Q1e§);
            }
            else
            {
               Connection.§_-Li§(§_-h2B§.§_-U1o§,§_-h2B§.§_-I2f§,location);
            }
         }
         this.§_-Q1e§ = "2" in param1 ? int(param1[2]) : this.§_-Q1e§;
         var _loc3_:int = "3" in param1 ? int(param1[3]) : mode;
         if(mode != _loc3_)
         {
            mode = _loc3_;
            this.§_-s2V§();
         }
         this.§_-o2H§.stop();
         this.§_-i13§.round(param1);
         §_-52p§.§_-t9§(this.§_-Q1e§);
         if(this.state == §_-S2I§.§_-JF§)
         {
            this.§_-X1C§(_loc2_);
            return;
         }
         §_-03e§.instance.hide(null);
         this.§_-92f§.visible = false;
         §_-52p§.clear();
         this.setFocus();
         this.§_-k26§(this.state == §_-S2I§.ROUND_WAITING);
         §_-r0§.instance.visible = this.state != §_-S2I§.ROUND_STARTING;
         switch(this.state)
         {
            case §_-S2I§.ROUND_WAITING:
               §_-52p§.§_-62k§(this.§_-i13§.squirrels.§_-f12§());
               this.§_-E1F§(_loc2_);
               break;
            case §_-S2I§.ROUND_STARTING:
               if(§_-TQ§.§_-u24§)
               {
                  DisplayObjectManager.getInstance().length;
               }
               this.§_-E1F§(_loc2_);
               §_-g1H§.show();
               break;
            case §_-S2I§.ROUND_PLAYING:
               this.§_-92f§.visible = true;
               this.§_-a1Z§(_loc2_);
               this.§_-Z1r§(this.§_-i13§.squirrels.§_-f12§());
               if(§_-q1p§.§_-l29§(location).teamMode)
               {
                  §_-52p§.§_-u2t§((this.§_-i13§.squirrels as §_-ME§).§_-v2G§,(this.§_-i13§.squirrels as §_-ME§).§_-J23§);
               }
               else
               {
                  §_-52p§.§_-62k§(this.§_-i13§.squirrels.§_-f12§());
               }
               break;
            case §_-S2I§.ROUND_START:
               §_-t1V§.§_-eq§();
               §_-Ey§.§_-51M§();
               §_-mQ§.hide();
               this.§_-KU§ = true;
               this.§_-a1Z§(_loc2_);
               this.§_-Os§(this.§_-i13§.squirrels.§_-f12§());
               if(§_-q1p§.§_-l29§(location).teamMode)
               {
                  §_-52p§.§_-u2t§((this.§_-i13§.squirrels as §_-ME§).§_-v2G§,(this.§_-i13§.squirrels as §_-ME§).§_-J23§);
               }
               else
               {
                  §_-52p§.§_-62k§(this.§_-i13§.squirrels.§_-f12§());
               }
         }
      }
      
      private function §_-Os§(param1:Array) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-wU§.length)
         {
            if(param1.indexOf(this.§_-wU§[_loc2_]) == -1)
            {
               this.§_-wU§.splice(_loc2_,1);
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            if(!(Game.§_-t1u§.indexOf(param1[_loc2_]) == -1 && !Game.§_-aC§(param1[_loc2_])))
            {
               if(this.§_-wU§.indexOf(param1[_loc2_]) == -1)
               {
                  §_-r0§.instance.sendMessage(param1[_loc2_],"",§_-A1n§.§_-32a§);
                  this.§_-wU§.push(param1[_loc2_]);
               }
            }
            _loc2_++;
         }
      }
      
      private function §_-Z1r§(param1:Array) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            if(!(Game.§_-t1u§.indexOf(param1[_loc2_]) == -1 && !Game.§_-aC§(param1[_loc2_])))
            {
               if(this.§_-wU§.indexOf(param1[_loc2_]) == -1)
               {
                  §_-r0§.instance.sendMessage(param1[_loc2_],"",§_-A1n§.§_-iG§);
               }
            }
            _loc2_++;
         }
      }
      
      private function §_-O16§(param1:int) : void
      {
         if(Game.§_-aC§(param1) || Game.§_-t1u§.indexOf(param1) != -1)
         {
            §_-r0§.instance.sendMessage(param1,"",§_-A1n§.§_-7u§);
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
      
      private function §_-k26§(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         this.clear();
         this.§_-lr§.visible = param1;
         if(!param1)
         {
            return;
         }
         switch(location)
         {
            case §_-q1p§.§_-C25§:
            case §_-q1p§.§_-X1n§:
               this.§_-rP§.text = gls("Сейчас на Солнечной Долине ты один. Подожди прихода других белок.");
               break;
            case §_-q1p§.§_-sL§:
               this.§_-rP§.text = gls("Сейчас на Топях ты один. Подожди прихода других белок.");
               break;
            case §_-q1p§.§_-P4§:
               this.§_-rP§.text = gls("Сейчас в Пустыне ты один. Подожди прихода других белок.");
               break;
            case §_-q1p§.§_-u2u§:
               this.§_-rP§.text = gls("Сейчас в Аномальной зоне ты один. Подожди прихода других белок.");
               break;
            case §_-q1p§.§_-A3z§:
               this.§_-rP§.text = gls("Сейчас на Испытании ты один. Подожди прихода других белок.");
               break;
            case §_-q1p§.§_-M1m§:
               _loc2_ = §_-q1p§.§_-42U§ - this.§_-I1y§ + 1;
               this.§_-rP§.text = _loc2_ > 0 ? gls("Для начала новой Битвы нужно подождать еще {0} {1}.",_loc2_,StringUtil.word("белка",_loc2_)) : "\n" + gls("Игра скоро начнется");
               break;
            case §_-q1p§.§_-Q1s§:
               this.§_-rP§.text = gls("Для начала игры в Шторме не хватает игроков");
               break;
            case §_-q1p§.§_-k2B§:
               this.§_-rP§.text = gls("Сейчас на Диких Землях ты один. Подожди прихода других белок.");
         }
      }
      
      private function §_-e1U§() : void
      {
         this.§_-P1P§ = false;
         this.isPlaying = false;
         Game.chat.hide();
         this.§_-o2H§.stop();
         Connection.§_-Li§(§_-h2B§.§_-U1o§,§_-h2B§.§_-a1u§,this.§_-M3§);
         if(!this.§_-M3§)
         {
            §_-71o§.show(§_-71o§.§_-n2M§ is §_-w17§ ? "Location" : §_-71o§.§_-n2M§);
         }
         else
         {
            start(location,false,false,§_-H26§);
         }
         if(!this.§_-KU§)
         {
            return;
         }
         this.§_-KU§ = false;
         §_-t1V§.§_-z1W§(this.§_-Q1e§);
      }
      
      private function §_-E1F§(param1:int) : void
      {
         §_-S2m§.instance.show(param1);
      }
      
      private function §_-5h§(param1:TimerEvent) : void
      {
         this.§_-s2N§(this.§_-o2H§.repeatCount - param1.currentTarget.currentCount);
      }
      
      private function §_-Tc§(param1:Event) : void
      {
         §_-52p§.clear();
      }
      
      private function §_-s2N§(param1:int) : void
      {
         §_-52p§.§_-O2r§(param1);
         this.§_-w2Y§.text = §_-52p§.getTime();
      }
      
      private function get §_-I1y§() : int
      {
         return this.§_-6b§;
      }
      
      private function set §_-I1y§(param1:int) : void
      {
         if(this.§_-6b§ == param1)
         {
            return;
         }
         this.§_-6b§ = param1;
         if(!§_-q1p§.§_-l29§(location).teamMode && (this.state == §_-S2I§.ROUND_START || this.state == §_-S2I§.ROUND_PLAYING))
         {
            §_-52p§.§_-62k§(this.§_-i13§.squirrels.§_-f12§());
         }
         if(this.state != §_-S2I§.ROUND_WAITING)
         {
            return;
         }
         this.§_-k26§(true);
         §_-52p§.§_-62k§(this.§_-i13§.squirrels.§_-f12§());
      }
      
      private function §_-a1Z§(param1:int) : void
      {
         this.clear();
         this.§_-o2H§.repeatCount = param1;
         this.§_-o2H§.reset();
         this.§_-o2H§.start();
         this.§_-nb§.§_-u2U§();
         this.§_-s2N§(param1);
         GameSounds.play("round_begin");
      }
      
      private function clear() : void
      {
         §_-S2m§.instance.hide();
         §_-52p§.clear();
         §_-g1H§.hide();
      }
      
      private function §_-3A§(param1:int) : Hero
      {
         if(this.§_-i13§ == null)
         {
            return null;
         }
         return this.§_-i13§.squirrels.get(param1);
      }
      
      private function §_-FM§(param1:GameEvent) : void
      {
         this.§_-d2f§ = true;
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         var _loc4_:Hero = null;
         var _loc5_:Hero = null;
         if(this.§_-P1P§ && param1.type != §_-S2I§.§_-R28§)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-S2I§.§_-Hk§:
               this.§_-62J§(param1);
               break;
            case §_-S2I§.§_-R28§:
               _loc2_ = this.§_-6h§.indexOf(param1[0]);
               if(_loc2_ != -1)
               {
                  this.§_-6h§.splice(_loc2_,1);
               }
               if(param1[0] == Game.selfId)
               {
                  this.§_-e1U§();
               }
               --this.§_-I1y§;
               §_-t1V§.§_-13f§();
               break;
            case §_-S2I§.§_-W1O§:
               this.round(param1);
               break;
            case §_-S2I§.§_-e1h§:
               if(this.§_-6h§.indexOf(param1[0]) == -1)
               {
                  this.§_-6h§.push(param1[0]);
               }
               if(this.state == §_-S2I§.ROUND_PLAYING || this.state == §_-S2I§.ROUND_START)
               {
                  this.§_-O16§(param1[0]);
               }
               ++this.§_-I1y§;
               break;
            case §_-S2I§.§_-Vs§:
               if(param1[0] == 1)
               {
                  return;
               }
               this.hollow(param1[1]);
               if(param1[1] == Game.selfId)
               {
                  §_-t1V§.§_-13f§();
                  §_-03e§.instance.hide(null);
               }
               break;
            case §_-S2I§.§_-F2m§:
               if(!(§_-71o§.active is §_-92z§) || param1[0] != Game.selfId)
               {
                  return;
               }
               §_-03e§.instance.hide(null);
               break;
            case §_-S2I§.§_-aR§:
               if(!(§_-71o§.active is §_-92z§))
               {
                  return;
               }
               if(param1[0] != §_-h2B§.§_-x1x§)
               {
                  return;
               }
               if(§_-IP§.§_-r1m§(param1[1]))
               {
                  break;
               }
               _loc3_ = §_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§ | §_-c10§.§_-639§) ? param1[2] : §_-019§.§_-l2k§(StringUtil.§_-T2i§(param1[2]));
               _loc4_ = this.§_-3A§(param1[1]);
               if(Boolean(_loc4_) && !_loc4_.isDead)
               {
                  _loc4_.heroView.sendMessage(_loc3_);
               }
               §_-92z§.sendMessage(param1[1],_loc3_,param1[0]);
               if(param1[1] != Game.self.id)
               {
                  GameSounds.play("message_recieve");
               }
               break;
            case §_-S2I§.§_-9L§:
               this.isPlaying = false;
               break;
            case §_-S2I§.§_-63o§:
               _loc5_ = this.§_-3A§(param1[0]);
               if(!_loc5_)
               {
                  return;
               }
               _loc5_.heroView.§_-cn§(param1[2],param1[1]);
         }
      }
   }
}

