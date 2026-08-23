package
{
   import §_-03j§.§_-cV§;
   import §_-53U§.§_-r1H§;
   import §_-68§.§_-M10§;
   import §_-I10§.§_-g2W§;
   import §_-N14§.§_-w2t§;
   import §_-RI§.§_-d2d§;
   import §_-RI§.§_-h2I§;
   import §_-RI§.§_-v2j§;
   import §_-qJ§.§_-j25§;
   import com.api.Player;
   import dragonBones.§_-Bq§;
   import dragonBones.§_-E1r§;
   import dragonBones.§_-TH§;
   import flash.display.BlendMode;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.utils.getDefinitionByName;
   import game.§_-D2B§;
   import game.§_-EG§;
   import game.§_-HN§;
   import game.§_-Z2x§;
   import game.§_-s1B§;
   import game.mainGame.§_-YI§;
   import utils.§_-Xc§;
   import utils.§_-i2C§;
   import views.§_-5b§;
   
   public class §_-01R§ extends §_-h2I§
   {
      
      private static const §_-B2z§:int = -60;
      
      private static const §_-L2E§:int = -65;
      
      private static const §_-q1y§:int = -63;
      
      private static const §_-qr§:int = -70;
      
      private static const §_-xj§:int = -80;
      
      private static const §_-R22§:int = -80;
      
      private static const §_-W16§:int = -80;
      
      private static const §_-O2g§:int = -80;
      
      private static const §_-N1Y§:int = 0;
      
      private static const §_-431§:int = 1;
      
      private static const §_-w2R§:int = 2;
      
      private static const §_-62z§:String = "acorn";
      
      private static const §_-229§:String = "belt";
      
      private static const §_-91f§:String = "hearts";
      
      public var §_-Wk§:§_-31F§ = null;
      
      public var scratView:§_-YF§ = null;
      
      public var §_-D2D§:§_-21X§ = null;
      
      public var viewAlternative:Sprite = null;
      
      public var circle:§_-d2d§ = new §_-d2d§(new Circle());
      
      public var §_-l2z§:Number = this.circle.width;
      
      public var §_-s7§:MovieClip = null;
      
      public var §_-q2N§:§_-d2d§ = null;
      
      public var §_-FS§:§_-i2C§ = null;
      
      public var §_-8F§:int = 0;
      
      public var armature:§_-E1r§;
      
      private var §_-jy§:* = null;
      
      private var §_-f2h§:Boolean = false;
      
      private var §_-J1P§:* = null;
      
      private var §_-FE§:* = null;
      
      private var §_-j1s§:* = null;
      
      private var §_-O1y§:* = null;
      
      private var §_-82s§:* = null;
      
      private var isDead:* = null;
      
      private var §_-zp§:* = null;
      
      private var §_-w1L§:* = null;
      
      private var hare:* = null;
      
      private var scrat:* = null;
      
      private var dragon:* = null;
      
      private var §_-M5§:Boolean = false;
      
      private var §_-WI§:Boolean = true;
      
      private var §_-33c§:§_-sF§ = null;
      
      private var §_-52v§:§_-P2l§ = null;
      
      private var §_-pZ§:§_-YI§ = null;
      
      private var §_-g1l§:§_-h2I§ = null;
      
      private var §_-y1L§:§_-h2I§ = null;
      
      private var §_-j1j§:§_-h2I§ = new §_-h2I§();
      
      private var §_-d17§:§_-h2I§ = new §_-h2I§();
      
      private var §_-h27§:§_-h2I§ = new §_-h2I§();
      
      private var §_-M2h§:§_-h2I§ = new §_-h2I§();
      
      private var §_-J1I§:§_-d2d§ = null;
      
      private var §_-d18§:Boolean = true;
      
      private var §_-73B§:§_-HN§ = null;
      
      private var §_-T2r§:§_-D2B§ = null;
      
      private var §_-p2Q§:§_-s1B§ = null;
      
      private var §_-B1S§:§_-EG§ = null;
      
      private var §_-71B§:§_-j25§ = null;
      
      private var §_-7R§:§_-r1H§ = null;
      
      private var §_-f2F§:int = 0;
      
      private var §_-Uz§:§_-P1U§ = null;
      
      private var player:Player = null;
      
      private var §_-Z1j§:int = 0;
      
      private var §_-8t§:int = -1;
      
      private var §_-y1a§:MovieClip = null;
      
      private var §_-j1S§:DisplayObject = null;
      
      private var §_-Z3§:int = Hero.§_-JL§;
      
      private var §_-i7§:Boolean = false;
      
      private var §_-K24§:int = 0;
      
      private var §_-Tq§:Number = 1;
      
      private var bubble:§_-h2I§ = null;
      
      private var §_-P1G§:* = null;
      
      private var §_-m2S§:§_-h2I§ = new §_-h2I§();
      
      private var §_-f2j§:Object = {};
      
      public function §_-01R§(param1:int)
      {
         super();
         this.player = Game.getPlayer(param1);
         if(param1 == Game.selfId)
         {
            this.§_-g1l§ = new §_-h2I§(new SquirrellLighting());
            this.§_-g1l§.§_-x2x§();
            this.§_-g1l§.y = -(this.§_-g1l§.height / 2.5);
            getStarlingView().addChildAt(this.§_-g1l§.getStarlingView(),0);
         }
         this.armature = §_-M10§.§_-238§().§_-g1F§(§_-M10§.§_-OS§);
         this.armature.addEventListener(§_-cV§.§_-d2O§,this.§_-YW§);
         §_-w2t§.§_-R2J§.add(this.armature);
         this.§_-7R§ = new §_-r1H§(this.armature);
         this.§_-j1j§.§_-83v§(this.armature.display);
         this.§_-73B§ = new §_-HN§();
         this.§_-73B§.x = -30;
         this.§_-T2r§ = new §_-D2B§();
         this.§_-T2r§.x = -30;
         this.§_-p2Q§ = new §_-s1B§();
         this.§_-p2Q§.x = -30;
         this.§_-B1S§ = new §_-EG§();
         this.§_-71B§ = new §_-j25§();
         this.§_-71B§.x = -10;
         §_-83v§(this.§_-j1j§);
         §_-83v§(this.§_-h27§);
         §_-83v§(this.§_-d17§);
         §_-83v§(this.§_-M2h§);
         this.§_-Uz§ = new §_-P1U§(param1);
         §_-83v§(this.§_-Uz§);
         this.§_-33c§ = new §_-sF§(this.§_-41S§);
         addChild(this.§_-33c§);
         this.§_-52v§ = new §_-P2l§();
         this.§_-52v§.x = -17;
         this.§_-52v§.visible = false;
         this.circle.touchable = false;
         this.circle.visible = false;
         this.circle.stop();
         this.§_-w2V§();
         this.mouseChildren = false;
         this.mouseEnabled = false;
      }
      
      override public function get alpha() : Number
      {
         if(!this.§_-j1j§)
         {
            return super.alpha;
         }
         if(this.player["id"] != Game.selfId)
         {
            return super.alpha;
         }
         return this.§_-j1j§.alpha;
      }
      
      override public function set alpha(param1:Number) : void
      {
         if(!this.§_-j1j§)
         {
            return;
         }
         if(this.player["id"] != Game.selfId)
         {
            super.alpha = param1;
         }
         this.§_-j1j§.alpha = param1;
         this.§_-d17§.alpha = param1;
         this.§_-h27§.alpha = param1;
         this.§_-M2h§.alpha = param1;
         this.§_-73B§.alpha = param1;
         this.§_-T2r§.alpha = param1;
         this.§_-p2Q§.alpha = param1;
         this.§_-B1S§.alpha = param1;
         this.§_-71B§.alpha = param1;
         if(this.viewAlternative != null)
         {
            this.viewAlternative.alpha = param1;
         }
         if(this.§_-q2N§)
         {
            this.§_-q2N§.alpha = param1;
         }
         if(this.§_-FS§)
         {
            this.§_-FS§.alpha = param1;
         }
         if(this.bubble)
         {
            this.bubble.alpha = param1;
         }
      }
      
      public function §_-l2f§(param1:String, param2:int, param3:int, param4:Boolean, param5:String = "") : void
      {
         if(param5.length > 0 && this.§_-Uz§.§_-6w§ == param5)
         {
            return;
         }
         this.§_-Uz§.playerName = param1;
         this.§_-Uz§.§_-J10§ = param2;
         this.§_-Uz§.league = param3;
         this.§_-Uz§.§_-63c§ = param4;
         this.§_-Uz§.§_-6w§ = param5;
         this.§_-Uz§.redraw();
         this.§_-41S§();
      }
      
      public function §_-d2r§(param1:Boolean) : void
      {
         if(!this.armature)
         {
            return;
         }
         this.armature.§_-M1s§("Head").childArmature.§_-M1s§("Eye").§_-r2q§ = param1 ? "black" : null;
         this.armature.§_-M1s§("Head").childArmature.§_-M1s§("Mouth").§_-r2q§ = param1 ? "black" : null;
         if(!param1)
         {
            return;
         }
         this.armature.§_-M1s§("Head").childArmature.animation.gotoAndPlay("black");
      }
      
      public function remove() : void
      {
         this.player = null;
         if(this.circle)
         {
            this.circle.removeFromParent();
         }
         if(this.§_-P1G§)
         {
            (this.§_-P1G§ as §_-v2j§).removeFromParent();
         }
         if(this.§_-f2j§["left"])
         {
            (this.§_-f2j§["left"] as §_-v2j§).removeFromParent();
         }
         if(this.§_-f2j§["right"])
         {
            (this.§_-f2j§["right"] as §_-v2j§).removeFromParent();
         }
         if(this.§_-J1I§)
         {
            this.§_-J1I§.removeFromParent(true);
         }
         this.§_-J1I§ = null;
         if(this.§_-7R§)
         {
            this.§_-7R§.remove();
         }
         this.§_-7R§ = null;
         if(this.scratView)
         {
            (this.scratView as §_-YF§).remove();
         }
         this.scratView = null;
         if(Boolean(this.§_-h27§) && this.§_-ws§(this.§_-h27§))
         {
            removeChildStarling(this.§_-h27§,true);
         }
         this.§_-h27§ = null;
         if(this.§_-Wk§)
         {
            (this.§_-Wk§ as §_-31F§).remove();
         }
         this.§_-Wk§ = null;
         if(Boolean(this.§_-d17§) && this.§_-ws§(this.§_-d17§))
         {
            removeChildStarling(this.§_-d17§,true);
         }
         this.§_-d17§ = null;
         if(this.§_-D2D§)
         {
            (this.§_-D2D§ as §_-21X§).remove();
         }
         this.§_-D2D§ = null;
         if(Boolean(this.§_-M2h§) && this.§_-ws§(this.§_-M2h§))
         {
            removeChildStarling(this.§_-M2h§,true);
         }
         this.§_-M2h§ = null;
         if(this.§_-ws§(this.§_-B1S§))
         {
            removeChildStarling(this.§_-B1S§);
         }
         this.§_-B1S§.dispose();
         this.§_-B1S§ = null;
         if(this.contains(this.§_-71B§))
         {
            removeChild(this.§_-71B§);
         }
         if(this.§_-ws§(this.§_-71B§))
         {
            removeChildStarling(this.§_-71B§);
         }
         this.§_-71B§.dispose();
         this.§_-71B§ = null;
         if(this.§_-ws§(this.§_-T2r§))
         {
            removeChildStarling(this.§_-T2r§);
         }
         this.§_-T2r§.dispose();
         this.§_-T2r§ = null;
         if(this.§_-ws§(this.§_-73B§))
         {
            removeChildStarling(this.§_-73B§);
         }
         this.§_-73B§.dispose();
         this.§_-73B§ = null;
         if(this.§_-ws§(this.§_-p2Q§))
         {
            removeChildStarling(this.§_-p2Q§);
         }
         this.§_-p2Q§.dispose();
         this.§_-p2Q§ = null;
         if(this.contains(this.§_-Uz§) || this.§_-ws§(this.§_-Uz§))
         {
            removeChildStarling(this.§_-Uz§);
         }
         this.§_-Uz§.dispose();
         this.§_-Uz§ = null;
         if(this.§_-pZ§)
         {
            this.§_-pZ§.dispose();
            this.§_-pZ§.removeFromParent();
         }
         this.§_-33c§.dispose();
         this.§_-52v§.dispose();
         if(this.§_-q2N§)
         {
            if(this.§_-ws§(this.§_-q2N§))
            {
               removeChildStarling(this.§_-q2N§);
            }
         }
         if(this.§_-FS§)
         {
            this.§_-FS§.remove();
            if(this.contains(this.§_-FS§))
            {
               removeChild(this.§_-FS§);
            }
         }
         if(this.bubble)
         {
            if(this.§_-ws§(this.bubble))
            {
               this.bubble.removeFromParent();
               this.bubble = null;
            }
         }
         this.circle = null;
         this.§_-s7§ = null;
         this.§_-q2N§ = null;
         this.bubble = null;
         §_-w2t§.§_-R2J§.remove(this.armature);
         this.armature.dispose();
         this.armature = null;
         if(this.§_-ws§(this.§_-j1j§))
         {
            removeChildStarling(this.§_-j1j§,false);
         }
         this.§_-j1j§ = null;
      }
      
      public function set §_-h1n§(param1:Boolean) : void
      {
         if(param1)
         {
            if(!this.§_-y1a§)
            {
               this.§_-y1a§ = new GumStart();
            }
            this.§_-y1a§.y = -20;
            addChild(this.§_-y1a§);
            return;
         }
         if(Boolean(this.§_-y1a§) && Boolean(this.§_-y1a§.parent))
         {
            this.§_-y1a§.parent.removeChild(this.§_-y1a§);
         }
      }
      
      public function set immortal(param1:Boolean) : void
      {
         if(param1 && !this.bubble)
         {
            this.bubble = new §_-h2I§(new ImmortalityBubble());
            this.§_-V1I§();
         }
         if(param1)
         {
            this.getStarlingView().addChildAt(this.bubble.getStarlingView(),0);
         }
         else
         {
            if(Boolean(this.bubble.getStarlingView()) && this.getStarlingView().contains(this.bubble.getStarlingView()))
            {
               this.bubble.getStarlingView().removeFromParent(true);
            }
            removeChildStarling(this.bubble);
            this.bubble = null;
         }
      }
      
      public function §_-6m§(param1:DisplayObject) : void
      {
         if(Boolean(this.§_-j1S§) && Boolean(this.§_-j1S§.parent))
         {
            this.§_-j1S§.parent.removeChild(this.§_-j1S§);
         }
         this.§_-j1S§ = param1;
         if(param1 == null)
         {
            return;
         }
         this.§_-j1S§.y = this.topOffset;
         addChildAt(this.§_-j1S§,getChildIndex(this.§_-33c§));
      }
      
      public function get §_-l1p§() : Boolean
      {
         return this.§_-i7§;
      }
      
      public function set §_-l1p§(param1:Boolean) : void
      {
         this.§_-i7§ = param1;
      }
      
      public function set §_-C26§(param1:int) : void
      {
         if(!this.circle)
         {
            return;
         }
         this.circle.touchable = false;
         this.circle.gotoAndStop(int(param1 * this.circle.totalFrames / 100));
      }
      
      public function get §_-A15§() : Boolean
      {
         return this.§_-82s§;
      }
      
      public function set §_-A15§(param1:Boolean) : void
      {
         if(this.§_-82s§ == param1)
         {
            return;
         }
         this.§_-82s§ = param1;
         this.update();
      }
      
      public function get §_-S23§() : §_-P1U§
      {
         return this.§_-Uz§;
      }
      
      public function get §_-E2U§() : §_-YI§
      {
         return this.§_-pZ§;
      }
      
      public function set §_-E2U§(param1:§_-YI§) : void
      {
         this.§_-pZ§ = param1;
         this.§_-pZ§.x = -30;
         §_-83v§(this.§_-pZ§);
         this.§_-41S§();
      }
      
      public function sendMessage(param1:String, param2:int = 5000) : void
      {
         this.§_-52v§.remove();
         this.§_-33c§.remove(true);
         if(param1)
         {
            this.§_-33c§.§_-BM§(param1,param2);
         }
      }
      
      public function §_-U2J§(param1:int) : void
      {
         this.§_-33c§.remove();
         this.§_-52v§.remove();
         this.§_-52v§.emotion = param1;
         addChild(this.§_-52v§);
      }
      
      public function set dead(param1:Boolean) : void
      {
         if(this.isDead == param1)
         {
            return;
         }
         this.isDead = param1;
         if(this.§_-Uz§)
         {
            this.§_-Uz§.visible = !param1;
         }
         if(this.§_-73B§)
         {
            this.§_-73B§.visible = !param1;
         }
         if(this.§_-s7§)
         {
            this.§_-s7§.visible = !param1;
         }
         if(this.§_-q2N§)
         {
            this.§_-q2N§.visible = !param1;
         }
         if(this.§_-FS§)
         {
            this.§_-FS§.visible = !param1;
            if(this.§_-FS§.visible)
            {
               this.§_-FS§.play();
            }
            else
            {
               this.§_-FS§.stop();
            }
         }
         if(this.bubble)
         {
            this.bubble.visible = !param1;
         }
         if(this.isDead)
         {
            this.§_-D1J§();
            this.§_-2i§();
         }
         this.update();
      }
      
      public function get dead() : Boolean
      {
         return this.isDead;
      }
      
      public function get §_-426§() : Boolean
      {
         return this.§_-f2h§;
      }
      
      public function set §_-426§(param1:Boolean) : void
      {
         if(this.§_-Wk§)
         {
            (this.§_-Wk§ as §_-31F§).§_-Oj§ = param1;
         }
         if(this.scratView)
         {
            (this.scratView as §_-YF§).§_-Oj§ = param1;
         }
         if(this.§_-D2D§)
         {
            (this.§_-D2D§ as §_-21X§).§_-Oj§ = param1;
         }
         if(this.§_-f2h§ == param1)
         {
            return;
         }
         this.§_-f2h§ = param1;
         this.armature.§_-M1s§(§_-62z§).§_-r2q§ = param1 ? §_-62z§ : null;
         this.armature.§_-M1s§(§_-229§).§_-r2q§ = param1 ? §_-62z§ : null;
         if(!param1)
         {
            return;
         }
         this.armature.animation.gotoAndPlay(§_-62z§,-1,-1,NaN,0,§_-62z§,"sameGroup");
         this.armature.§_-V1S§();
         §_-w2t§.§_-R2J§.§_-ld§(§_-01Y§.delay);
      }
      
      public function setClothing(param1:Array, param2:Array = null) : void
      {
         if(param1 == null)
         {
            param1 = [];
         }
         if(param2 == null)
         {
            param2 = [];
         }
         if(this.§_-7R§ != null)
         {
            this.§_-7R§.clear();
         }
         this.§_-M5§ = false;
         var _loc3_:Array = [];
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < param1.length)
         {
            if(§_-g2W§.§_-D2d§(param1[_loc5_]))
            {
               _loc4_.push(param1[_loc5_]);
            }
            else if(!§_-g2W§.§_-91b§(param1[_loc5_]) && !§_-g2W§.§_-W2e§(param1[_loc5_]))
            {
               _loc3_.push(param1[_loc5_]);
               this.§_-M5§ = this.§_-M5§ || §_-g2W§.§_-f1y§(param1[_loc5_]);
            }
            _loc5_++;
         }
         if(_loc4_.length == 0)
         {
            _loc4_.push(§_-g2W§.§_-03k§);
         }
         if(this.§_-7R§ != null)
         {
            this.§_-7R§.§_-K26§(this.shaman ? _loc4_ : _loc3_,this.shaman ? null : param2);
         }
         if(this.scratView)
         {
            (this.scratView as §_-YF§).setClothing(param1);
         }
         this.update();
         this.§_-41S§();
         if(this.visible)
         {
            this.§_-z8§();
         }
      }
      
      public function get emotion() : Boolean
      {
         return this.§_-j1s§;
      }
      
      public function get §_-026§() : int
      {
         return this.§_-Z1j§;
      }
      
      public function §_-Ci§(param1:int) : void
      {
         if(this.emotion && this.§_-Z1j§ == param1 || this.§_-k2P§ || this.running)
         {
            return;
         }
         if(param1 >= Hero.§_-wo§)
         {
            return;
         }
         this.§_-j1s§ = true;
         this.§_-Z1j§ = param1;
         this.§_-w1L§ = true;
         this.§_-d2r§(false);
         this.update();
      }
      
      public function §_-L2y§() : void
      {
         this.§_-j1s§ = false;
         if(this.§_-Wk§)
         {
            (this.§_-Wk§ as §_-31F§).laugh = false;
         }
         this.§_-d2r§(this.§_-Z3§ == Hero.§_-O18§);
         this.update();
      }
      
      public function get shaman() : Boolean
      {
         return this.§_-O1y§;
      }
      
      public function set shaman(param1:Boolean) : void
      {
         if(this.§_-O1y§ == param1)
         {
            return;
         }
         if(this.§_-7R§ != null)
         {
            this.§_-7R§.clear();
         }
         this.§_-O1y§ = param1;
         if(this.§_-s7§)
         {
            this.§_-s7§.visible = !param1;
         }
         if(!param1)
         {
            if(this.player["worn"] != null)
            {
               this.setClothing(this.player["worn_packages"],this.player["worn_accessories"]);
            }
            this.§_-d2r§(false);
         }
         else
         {
            this.§_-G1Z§();
         }
         this.§_-Uz§.shaman = param1;
         this.§_-41S§();
         this.§_-j1j§.visible = !this.hare && !this.dragon && (this.shaman || !(this.scrat && this.§_-WI§));
         this.§_-h27§.visible = !this.hare && !this.shaman && !this.dragon && Boolean(this.scrat) && this.§_-WI§;
         this.§_-M2h§.visible = !this.hare && !this.shaman && !this.scrat && Boolean(this.dragon);
         this.update();
         if(this.visible)
         {
            this.§_-z8§();
         }
      }
      
      public function §_-f2b§(param1:Boolean) : void
      {
         if(Boolean(this.§_-y1L§) && !param1)
         {
            this.§_-y1L§.removeFromParent();
            this.§_-y1L§ = null;
         }
         if(param1 && !this.§_-y1L§)
         {
            this.§_-y1L§ = new §_-h2I§(new ArrowMovie());
            this.§_-y1L§.rotation = -90;
            this.§_-y1L§.x = -13;
            this.§_-y1L§.y -= this.§_-y1L§.height + this.§_-Uz§.height * 0.5;
            this.§_-83v§(this.§_-y1L§);
         }
      }
      
      public function get team() : int
      {
         return this.§_-Z3§;
      }
      
      public function set team(param1:int) : void
      {
         if(this.§_-Z3§ == param1)
         {
            return;
         }
         this.§_-Z3§ = param1;
         if(this.shaman)
         {
            this.§_-G1Z§();
         }
         this.§_-Uz§.team = param1;
         this.update();
      }
      
      public function get running() : Boolean
      {
         return this.§_-J1P§;
      }
      
      public function set running(param1:Boolean) : void
      {
         if(this.§_-J1P§ == param1)
         {
            return;
         }
         this.§_-J1P§ = param1;
         if(param1)
         {
            this.§_-j1s§ = false;
         }
      }
      
      public function get direction() : Boolean
      {
         return this.§_-zp§;
      }
      
      public function set direction(param1:Boolean) : void
      {
         if(this.§_-zp§ == param1)
         {
            return;
         }
         this.§_-zp§ = param1;
         this.armature.display.scaleX = (param1 ? 1 : -1) * Math.abs(this.armature.display.scaleX);
         this.§_-d17§.getStarlingView().scaleX = (param1 ? 1 : -1) * Math.abs(this.§_-d17§.getStarlingView().scaleX);
         this.§_-h27§.getStarlingView().scaleX = (param1 ? 1 : -1) * Math.abs(this.§_-h27§.getStarlingView().scaleX);
         this.§_-M2h§.getStarlingView().scaleX = (param1 ? 1 : -1) * Math.abs(this.§_-M2h§.getStarlingView().scaleX);
         if(Boolean(this.viewAlternative) && this.§_-d18§)
         {
            this.viewAlternative.scaleX = (param1 ? 1 : -1) * Math.abs(this.viewAlternative.scaleX);
         }
      }
      
      public function get §_-k2P§() : Boolean
      {
         return this.§_-FE§;
      }
      
      public function set §_-k2P§(param1:Boolean) : void
      {
         if(this.§_-FE§ == param1)
         {
            return;
         }
         this.§_-FE§ = param1;
         if(param1)
         {
            this.§_-j1s§ = false;
         }
      }
      
      public function update() : void
      {
         if(this.§_-J1I§)
         {
            this.§_-J1I§.visible = this.dead && !this.shaman && !this.§_-l1p§;
         }
         if(Boolean(this.armature) && Boolean(this.armature.display))
         {
            this.armature.display.visible = !this.dead;
         }
         if(this.§_-jy§ != this.state || Boolean(this.§_-jy§ == this.state && this.state == Hero.§_-z2a§) && Boolean(this.§_-w1L§))
         {
            this.§_-z8§();
         }
         if(Boolean(this.§_-g1l§) && this.§_-8t§ != §_-5b§.highlight)
         {
            this.§_-8t§ = §_-5b§.highlight;
            this.§_-g1l§.alpha = this.§_-8t§ * 0.4;
         }
      }
      
      public function §_-13a§(param1:Number) : void
      {
         var _loc2_:String = null;
         var _loc3_:§_-TH§ = null;
         for each(_loc2_ in ["Head","Cap","Cap_accessory","Glasses"])
         {
            _loc3_ = this.armature.§_-M1s§(_loc2_);
            _loc3_.§_-F1v§.scaleX = _loc3_.§_-F1v§.scaleY = param1;
         }
      }
      
      public function set scale(param1:Number) : void
      {
         if(this.§_-Tq§ == param1)
         {
            return;
         }
         this.§_-Tq§ = param1;
         this.scaleY = param1;
         this.scaleX = (this.scaleX ? 1 : -1) * Math.abs(this.scaleY);
         this.y = param1 < 1 ? Hero.§_-YH§ * param1 : Hero.§_-YH§;
         this.§_-33c§.scaleX = this.§_-33c§.scaleY = this.scaleY;
         if(this.§_-q2N§)
         {
            this.§_-q2N§.scaleX = this.§_-q2N§.scaleY = this.scaleY;
         }
         if(this.§_-FS§)
         {
            this.§_-FS§.scaleX = this.§_-FS§.scaleY = this.scaleY;
         }
         this.§_-V1I§();
         this.§_-41S§();
      }
      
      public function §_-A2O§(param1:SimpleButton, param2:int, param3:Boolean = true) : void
      {
         this.§_-73B§.play(param1,param2,param3);
         §_-83v§(this.§_-73B§);
      }
      
      public function §_-420§(param1:SimpleButton, param2:Boolean = true) : void
      {
         this.§_-T2r§.play(param1,0,param2);
         §_-83v§(this.§_-T2r§);
      }
      
      public function §_-v2K§() : void
      {
         this.§_-73B§.stop();
      }
      
      public function §_-o2z§() : void
      {
         this.§_-T2r§.§_-2e§();
      }
      
      public function §_-cn§(param1:int, param2:int, param3:int = 0) : void
      {
         this.§_-p2Q§.§_-Y2E§(param1,param2,param3);
         if(this.§_-ws§(this.§_-p2Q§))
         {
            removeChildStarling(this.§_-p2Q§,false);
         }
         this.§_-p2Q§.scaleXY(1);
         §_-83v§(this.§_-p2Q§);
      }
      
      public function §_-ZX§() : void
      {
         removeChildStarling(this.§_-p2Q§);
      }
      
      public function §_-634§(param1:MovieClip) : void
      {
         this.§_-B1S§.view = param1;
         this.§_-B1S§.§_-Y2E§(0,0,§_-Z2x§.§_-vt§);
         if(this.§_-ws§(this.§_-B1S§))
         {
            removeChildStarling(this.§_-B1S§,false);
         }
         this.§_-B1S§.scaleXY(1);
         §_-83v§(this.§_-B1S§);
      }
      
      public function §_-Hl§(param1:Hero, param2:int) : void
      {
         this.§_-71B§.§_-L1T§(param1,param2);
         if(this.§_-ws§(this.§_-71B§))
         {
            removeChildStarling(this.§_-71B§,false);
         }
         this.§_-71B§.scaleXY(1);
         §_-83v§(this.§_-71B§);
      }
      
      public function §_-S2O§() : void
      {
         if(!this.§_-q2N§)
         {
            this.§_-q2N§ = new §_-d2d§(new ActiveAura());
            this.§_-q2N§.loop = false;
         }
         else if(this.§_-ws§(this.§_-q2N§))
         {
            removeChildStarling(this.§_-q2N§,false);
         }
         this.§_-q2N§.scaleXY(1);
         this.§_-q2N§.§_-x2x§();
         this.§_-q2N§.x = 0;
         this.§_-q2N§.y = -20;
         this.§_-q2N§.gotoAndPlay(0);
         §_-83v§(this.§_-q2N§);
      }
      
      public function §_-E2p§() : void
      {
         if(this.§_-K24§++)
         {
            return;
         }
         if(!this.§_-FS§)
         {
            this.§_-FS§ = new §_-i2C§(new PassiveAura());
            this.§_-FS§.x = -25;
            this.§_-FS§.y = -30;
         }
         this.§_-FS§.play();
         addChild(this.§_-FS§);
      }
      
      public function §_-W2h§() : void
      {
         if(this.§_-K24§ == 0 || !this.§_-FS§)
         {
            return;
         }
         --this.§_-K24§;
         if(this.§_-K24§ != 0)
         {
            return;
         }
         this.§_-FS§.stop();
         if(contains(this.§_-FS§))
         {
            removeChild(this.§_-FS§);
         }
      }
      
      public function §_-2i§(param1:Sprite = null, param2:Boolean = true) : void
      {
         if(this.§_-j1j§ == null)
         {
            return;
         }
         this.§_-d18§ = param2;
         if(Boolean(this.viewAlternative) && this.contains(this.viewAlternative))
         {
            removeChild(this.viewAlternative);
         }
         if(this.viewAlternative is §_-h2I§ && this.§_-ws§(this.viewAlternative))
         {
            removeChildStarling(this.viewAlternative,false);
         }
         if(param1 == null)
         {
            this.§_-d17§.visible = Boolean(this.isHare);
            this.§_-j1j§.visible = !this.hare && !this.dragon && (this.shaman || !(this.scrat && this.§_-WI§));
            this.§_-h27§.visible = !this.hare && !this.shaman && !this.dragon && Boolean(this.scrat) && this.§_-WI§;
            this.§_-M2h§.visible = Boolean(this.dragon);
            return;
         }
         this.§_-Uz§.visible = true;
         this.§_-j1j§.visible = false;
         this.§_-d17§.visible = false;
         this.§_-h27§.visible = false;
         this.§_-M2h§.visible = false;
         this.viewAlternative = param1;
         if(this.§_-d18§)
         {
            this.viewAlternative.scaleX = (this.direction ? 1 : -1) * Math.abs(this.scaleX);
         }
         this.viewAlternative.alpha = this.§_-j1j§.alpha;
         addChildAt(this.viewAlternative,1);
         if(this.viewAlternative is §_-h2I§)
         {
            §_-83v§(this.viewAlternative);
         }
         this.§_-41S§();
      }
      
      public function §_-72F§(param1:DisplayObject, param2:Boolean = false, param3:Boolean = true) : void
      {
         if(Boolean(this.viewAlternative) && this.contains(this.viewAlternative))
         {
            removeChild(this.viewAlternative);
         }
         if(this.§_-d17§)
         {
            this.§_-d17§.visible = false;
         }
         this.viewAlternative = param1 as Sprite;
         if(Boolean(this.viewAlternative) && Boolean(param1))
         {
            if(param3)
            {
               this.viewAlternative.scaleX = (this.direction ? 1 : -1) * Math.abs(this.scaleX);
            }
            this.viewAlternative.alpha = this.§_-j1j§ ? this.§_-j1j§.alpha : 0;
            this.viewAlternative.x = this.viewAlternative.x;
            this.viewAlternative.y = this.viewAlternative.y;
            addChild(this.viewAlternative);
         }
      }
      
      public function get isHare() : *
      {
         return this.hare;
      }
      
      public function set isHare(param1:*) : void
      {
         if(this.hare == param1)
         {
            return;
         }
         if(!this.§_-Wk§ && Boolean(param1))
         {
            this.§_-Wk§ = new §_-31F§();
            (this.§_-Wk§ as §_-31F§).§_-Oj§ = this.§_-426§;
            this.§_-d17§.§_-83v§(this.§_-Wk§);
         }
         this.hare = param1;
         this.§_-d17§.visible = Boolean(param1);
         this.§_-j1j§.visible = !this.hare && !this.dragon && (this.shaman || !(this.scrat && this.§_-WI§));
         this.§_-h27§.visible = !this.hare && !this.shaman && !this.dragon && Boolean(this.scrat) && this.§_-WI§;
         this.§_-M2h§.visible = Boolean(this.dragon);
         this.§_-41S§();
         if(Boolean(param1) && Boolean(this.viewAlternative) && this.contains(this.viewAlternative))
         {
            removeChild(this.viewAlternative);
         }
      }
      
      public function get isScrat() : Boolean
      {
         return this.scrat;
      }
      
      public function set isScrat(param1:Boolean) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         if(this.scrat == param1)
         {
            return;
         }
         if(!this.scratView && param1)
         {
            _loc2_ = false;
            _loc3_ = 0;
            while(_loc3_ < this.player["worn_packages"].length)
            {
               _loc2_ ||= §_-g2W§.§_-91b§(this.player["worn_packages"][_loc3_]);
               _loc3_++;
            }
            this.scratView = new §_-YF§(_loc2_);
            (this.scratView as §_-YF§).§_-Oj§ = this.§_-426§;
            this.§_-h27§.§_-83v§(this.scratView);
         }
         this.scrat = param1;
         this.§_-d17§.visible = Boolean(this.hare);
         this.§_-j1j§.visible = !this.hare && !this.dragon && (this.shaman || !(param1 && this.§_-WI§));
         this.§_-h27§.visible = !this.hare && !this.shaman && !this.dragon && this.§_-WI§ && param1;
         this.§_-M2h§.visible = Boolean(this.dragon);
         this.§_-41S§();
         if(Boolean(param1) && Boolean(this.viewAlternative) && this.contains(this.viewAlternative))
         {
            removeChild(this.viewAlternative);
         }
      }
      
      public function get isDragon() : *
      {
         return this.dragon;
      }
      
      public function set isDragon(param1:*) : void
      {
         if(this.dragon == param1)
         {
            return;
         }
         if(!this.§_-D2D§ && Boolean(param1))
         {
            this.§_-D2D§ = new §_-21X§();
            (this.§_-D2D§ as §_-21X§).§_-Oj§ = this.§_-426§;
            this.§_-M2h§.§_-83v§(this.§_-D2D§);
         }
         this.dragon = param1;
         this.§_-d17§.visible = Boolean(this.hare);
         this.§_-j1j§.visible = !this.hare && !this.dragon && (this.shaman || !(this.scrat && this.§_-WI§));
         this.§_-h27§.visible = !this.hare && !this.shaman && !this.dragon && Boolean(this.scrat) && this.§_-WI§;
         this.§_-M2h§.visible = Boolean(this.dragon);
         this.§_-41S§();
         if(Boolean(param1) && Boolean(this.viewAlternative) && this.contains(this.viewAlternative))
         {
            removeChild(this.viewAlternative);
         }
      }
      
      public function set §_-91I§(param1:Boolean) : void
      {
         this.§_-WI§ = param1;
         this.§_-h27§.visible = !this.hare && !this.shaman && !this.dragon && Boolean(this.scrat) && this.§_-WI§;
         this.§_-j1j§.visible = !this.hare && !this.dragon && (this.shaman || !(this.scrat && this.§_-WI§));
      }
      
      public function get §_-yR§() : int
      {
         if(this.shaman)
         {
            return §_-L2E§;
         }
         if(this.isScrat)
         {
            return §_-qr§;
         }
         if(this.isDragon)
         {
            return §_-q1y§;
         }
         if(this.isHare)
         {
            return §_-xj§;
         }
         if(Boolean(this.viewAlternative) && this.viewAlternative.name == "Vendigo")
         {
            return §_-R22§;
         }
         if(Boolean(this.viewAlternative) && this.viewAlternative.name == "SnowLeopard")
         {
            return §_-W16§;
         }
         if(Boolean(this.viewAlternative) && this.viewAlternative.name == "WildBoar")
         {
            return §_-W16§;
         }
         if(Boolean(this.viewAlternative) && this.viewAlternative.name == "WildHog")
         {
            return §_-W16§;
         }
         if(Boolean(this.viewAlternative) && this.viewAlternative.name == "ClothesFlightView")
         {
            return §_-O2g§;
         }
         return §_-B2z§;
      }
      
      public function get topOffset() : int
      {
         return this.§_-f2F§;
      }
      
      private function §_-41S§() : void
      {
         this.§_-Uz§.y = this.§_-yR§ - 5;
         var _loc1_:Number = this.§_-Uz§.height > 0 ? this.§_-Uz§.height : 5;
         if(this.§_-pZ§)
         {
            this.§_-pZ§.y = this.§_-yR§ - _loc1_;
            this.§_-33c§.y = this.§_-pZ§.y - this.§_-pZ§.height - this.§_-33c§.height;
         }
         else
         {
            this.§_-33c§.y = this.§_-yR§ - _loc1_ - this.§_-33c§.height;
         }
         this.§_-f2F§ = this.§_-33c§.y - 3;
         this.§_-52v§.y = this.§_-f2F§;
         this.§_-73B§.y = this.§_-f2F§;
         this.§_-T2r§.y = this.§_-f2F§;
         this.§_-p2Q§.y = this.§_-f2F§;
         this.§_-71B§.y = this.§_-f2F§;
         this.§_-B1S§.y = this.§_-f2F§;
      }
      
      private function §_-V1I§() : void
      {
         if(this.bubble)
         {
            this.bubble.y = -33 * this.§_-Tq§;
         }
      }
      
      private function §_-w2V§() : void
      {
         var _loc1_:§_-TH§ = this.armature.§_-M1s§("Head");
         var _loc2_:§_-Bq§ = §_-M10§.§_-r2s§();
         var _loc3_:§_-h2I§ = new §_-h2I§();
         this.§_-P1G§ = new §_-d2d§(new KissHearts());
         this.§_-P1G§.x = 25;
         this.§_-P1G§.y = 72;
         this.§_-P1G§.loop = false;
         this.§_-P1G§.stop();
         _loc3_.§_-83v§(this.§_-P1G§.getStarlingView());
         _loc2_.display = _loc3_.getStarlingView();
         _loc2_.§_-I2C§.copy(_loc1_.§_-I2C§);
         _loc2_.zOrder = this.armature.§_-81k§().length + 1;
         _loc1_.addChild(_loc2_);
         this.§_-f2j§["left"] = new §_-d2d§(new ShamTears());
         this.§_-f2j§["left"].scaleX *= -1;
         this.§_-f2j§["left"].x = 7;
         this.§_-f2j§["left"].y = 32;
         this.§_-f2j§["left"].stop();
         this.§_-m2S§.§_-83v§(this.§_-f2j§["left"].getStarlingView());
         this.§_-f2j§["right"] = new §_-d2d§(new ShamTears());
         this.§_-f2j§["right"].x = -5;
         this.§_-f2j§["right"].y = 31;
         this.§_-f2j§["right"].stop();
         this.§_-m2S§.§_-83v§(this.§_-f2j§["right"].getStarlingView());
         _loc2_ = §_-M10§.§_-r2s§();
         _loc2_.display = this.§_-m2S§.getStarlingView();
         _loc2_.§_-I2C§.copy(_loc1_.§_-I2C§);
         _loc2_.§_-F1v§.rotation = -0.2;
         _loc2_.zOrder = this.armature.§_-81k§().length + 1;
         _loc1_.addChild(_loc2_);
         this.§_-P1G§.visible = this.§_-m2S§.visible = false;
      }
      
      private function §_-D1J§() : void
      {
         if(Boolean(this.§_-J1I§) || !this.§_-j1j§)
         {
            return;
         }
         var _loc1_:Class = getDefinitionByName("HeroDead") as Class;
         if(_loc1_ == null)
         {
            return;
         }
         this.§_-J1I§ = new §_-d2d§(new _loc1_());
         this.§_-J1I§.x = -30;
         this.§_-J1I§.y = -150;
         this.§_-J1I§.blendMode = BlendMode.SCREEN;
         this.§_-J1I§.loop = false;
         this.§_-j1j§.§_-83v§(this.§_-J1I§);
      }
      
      private function get state() : int
      {
         if(!this.visible)
         {
            return Hero.§_-1d§;
         }
         if(this.dead)
         {
            return Hero.§_-Mn§;
         }
         if(this.§_-82s§)
         {
            return Hero.§_-53A§;
         }
         if(this.§_-k2P§)
         {
            return Hero.§_-ZP§;
         }
         if(this.running)
         {
            return Hero.§_-w11§;
         }
         if(this.emotion)
         {
            return Hero.§_-z2a§;
         }
         return Hero.§_-T1p§;
      }
      
      private function §_-z8§() : void
      {
         var _loc1_:String = null;
         this.§_-jy§ = this.state;
         if(Boolean(this.§_-Wk§) && !this.§_-j1j§.visible)
         {
            (this.§_-Wk§ as §_-31F§).setState(this.state);
         }
         if(Boolean(this.§_-D2D§) && !this.§_-j1j§.visible)
         {
            (this.§_-D2D§ as §_-21X§).setState(this.state);
         }
         if(Boolean(this.scratView) && !this.§_-j1j§.visible)
         {
            (this.scratView as §_-YF§).setState(this.state);
         }
         if(Boolean(this.viewAlternative) && this.viewAlternative is §_-Xc§)
         {
            (this.viewAlternative as §_-Xc§).setState(this.state);
         }
         if(this.§_-P1G§)
         {
            this.§_-P1G§.visible = false;
         }
         if(this.§_-m2S§)
         {
            this.§_-m2S§.visible = false;
         }
         if(this.§_-f2j§["right"])
         {
            this.§_-f2j§["right"].stop();
         }
         if(this.§_-f2j§["left"])
         {
            this.§_-f2j§["left"].stop();
         }
         switch(this.state)
         {
            case Hero.§_-Mn§:
               if(Boolean(this.§_-l1p§) || Boolean(this.§_-d17§ && this.§_-Wk§ && this.§_-d17§.visible) || Boolean(this.§_-h27§ && this.scratView) && Boolean(this.§_-h27§.visible) || Boolean(this.§_-M2h§ && this.§_-D2D§) && Boolean(this.§_-M2h§.visible))
               {
                  break;
               }
               if(this.§_-J1I§)
               {
                  this.§_-J1I§.gotoAndPlay(1);
               }
               break;
            case Hero.§_-z2a§:
               this.§_-w1L§ = false;
               if(Boolean(this.§_-d17§) && Boolean(this.§_-Wk§) && this.§_-d17§.visible)
               {
                  (this.§_-Wk§ as §_-31F§).laugh = true;
                  break;
               }
               _loc1_ = "";
               switch(this.§_-026§)
               {
                  case Hero.§_-G1g§:
                     _loc1_ = Hero.§_-53V§;
                     break;
                  case Hero.§_-tM§:
                     _loc1_ = Hero.§_-ef§;
                     break;
                  case Hero.§_-f1r§:
                     _loc1_ = Hero.§_-F10§;
                     if(this.§_-m2S§)
                     {
                        this.§_-m2S§.visible = true;
                     }
                     if(this.§_-f2j§["right"])
                     {
                        this.§_-f2j§["right"].play();
                     }
                     if(this.§_-f2j§["left"])
                     {
                        this.§_-f2j§["left"].play();
                     }
                     break;
                  case Hero.§_-m1g§:
                     _loc1_ = Hero.§_-y2b§;
               }
               if(Boolean(this.armature) && Boolean(this.armature.animation) && _loc1_ != "")
               {
                  this.armature.animation.gotoAndPlay(_loc1_);
               }
               break;
            case Hero.§_-1d§:
               this.§_-jy§ = this.state;
               if(Boolean(this.armature) && Boolean(this.armature.animation))
               {
                  this.armature.animation.stop();
               }
               break;
            default:
               if(this.state in Hero.§_-E1k§)
               {
                  switch(this.state)
                  {
                     case Hero.§_-53A§:
                        if(this.armature)
                        {
                           if(this.§_-8F§ == §_-431§)
                           {
                              this.armature.animation.gotoAndPlay(Hero.§_-RM§);
                           }
                           else
                           {
                              this.armature.animation.gotoAndPlay(Hero.§_-E1k§[this.state]);
                           }
                           break;
                        }
                     case Hero.§_-w11§:
                     case Hero.§_-ZP§:
                        if(Boolean(this.armature) && Boolean(this.armature.animation))
                        {
                           if(this.§_-M5§ && !this.shaman)
                           {
                              this.armature.animation.gotoAndPlay(Hero.§_-01j§);
                           }
                           else
                           {
                              this.armature.animation.gotoAndPlay(Hero.§_-E1k§[this.state]);
                           }
                           break;
                        }
                     default:
                        if(Boolean(this.armature) && Boolean(this.armature.animation))
                        {
                           this.armature.animation.gotoAndPlay(Hero.§_-E1k§[this.state]);
                        }
                  }
               }
         }
      }
      
      private function §_-G1Z§() : void
      {
         var shamanClothes:Array = null;
         switch(this.team)
         {
            case Hero.§_-114§:
               this.setClothing([§_-g2W§.§_-03k§]);
               break;
            case Hero.§_-17§:
               this.setClothing([§_-g2W§.§_-81U§]);
               break;
            case Hero.§_-O18§:
               this.setClothing([§_-g2W§.§_-QH§]);
               this.§_-d2r§(true);
               break;
            default:
               shamanClothes = [];
               if(Boolean(this.player) && "worn" in this.player)
               {
                  shamanClothes = (this.player["worn_packages"] as Array).filter(function(param1:*, param2:int, param3:Array):Boolean
                  {
                     if(Boolean(param3) && Boolean(param2))
                     {
                     }
                     return §_-g2W§.§_-z1V§(param1) == §_-g2W§.§_-YG§;
                  });
               }
               if(shamanClothes.length == 0)
               {
                  this.setClothing([§_-g2W§.§_-03k§]);
               }
               else
               {
                  this.setClothing(shamanClothes);
               }
               this.§_-8F§ = §_-g2W§.§_-p1I§(shamanClothes[0]);
         }
      }
      
      private function §_-YW§(param1:§_-cV§) : void
      {
         if(param1.frameLabel != §_-91f§)
         {
            return;
         }
         this.§_-P1G§.visible = true;
         this.§_-P1G§.gotoAndPlay(0);
      }
   }
}

