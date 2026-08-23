package
{
   import §_-921§.§_-DK§;
   import §_-AY§.§_-o2n§;
   import §_-Sx§.§_-b2K§;
   import §_-TK§.§_-51g§;
   import §_-TK§.§_-aS§;
   import §_-TK§.§_-f1u§;
   import §_-Vu§.§_-p4§;
   import §_-X1k§.§_-P2x§;
   import §_-s2e§.§_-O1h§;
   import com.api.Player;
   import dragonBones.§_-833§;
   import dragonBones.§_-83b§;
   import dragonBones.§_-z2H§;
   import flash.display.BlendMode;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.utils.getDefinitionByName;
   import game.§_-02D§;
   import game.§_-420§;
   import game.§_-ZP§;
   import game.§_-k2Q§;
   import game.§_-u2§;
   import game.mainGame.§_-K1G§;
   import utils.§_-h25§;
   import utils.§_-y4§;
   import views.§_-y27§;
   
   public class §_-c2W§ extends §_-aS§
   {
      
      private static const §_-536§:int = -60;
      
      private static const §_-i2§:int = -65;
      
      private static const §_-31M§:int = -63;
      
      private static const §_-b1k§:int = -70;
      
      private static const §_-o28§:int = -80;
      
      private static const §_-F1i§:int = -80;
      
      private static const §_-v2D§:int = -80;
      
      private static const §_-36§:int = -80;
      
      private static const §_-G1y§:int = 0;
      
      private static const §_-G2w§:int = 1;
      
      private static const §_-2t§:int = 2;
      
      private static const §_-Xw§:String = "acorn";
      
      private static const §_-eD§:String = "belt";
      
      private static const §_-E2f§:String = "hearts";
      
      public var §_-t2V§:§_-23o§ = null;
      
      public var scratView:§_-112§ = null;
      
      public var §_-R9§:§_-Pu§ = null;
      
      public var viewAlternative:Sprite = null;
      
      public var circle:§_-f1u§ = new §_-f1u§(new Circle());
      
      public var §_-C15§:Number = this.circle.width;
      
      public var §_-A3x§:MovieClip = null;
      
      public var §_-Fx§:§_-f1u§ = null;
      
      public var §_-Jh§:§_-h25§ = null;
      
      public var §_-91s§:int = 0;
      
      public var armature:§_-833§;
      
      private var §_-a§:* = null;
      
      private var §_-j2Q§:Boolean = false;
      
      private var §_-fB§:* = null;
      
      private var §_-vo§:* = null;
      
      private var §_-a1v§:* = null;
      
      private var §_-C1F§:* = null;
      
      private var §_-Q25§:* = null;
      
      private var isDead:* = null;
      
      private var §_-E2n§:* = null;
      
      private var §_-W2f§:* = null;
      
      private var hare:* = null;
      
      private var scrat:* = null;
      
      private var dragon:* = null;
      
      private var §_-52j§:Boolean = false;
      
      private var §_-216§:Boolean = true;
      
      private var §_-37§:§_-b2H§ = null;
      
      private var §_-gY§:§_-C17§ = null;
      
      private var §_-qz§:§_-K1G§ = null;
      
      private var §_-12b§:§_-aS§ = null;
      
      private var §_-M1R§:§_-aS§ = null;
      
      private var §_-t1h§:§_-aS§ = new §_-aS§();
      
      private var §_-Y2N§:§_-aS§ = new §_-aS§();
      
      private var §_-T2k§:§_-aS§ = new §_-aS§();
      
      private var §_-Y2d§:§_-aS§ = new §_-aS§();
      
      private var §_-w1L§:§_-f1u§ = null;
      
      private var §_-13t§:Boolean = true;
      
      private var §_-62p§:§_-u2§ = null;
      
      private var §_-z2e§:§_-02D§ = null;
      
      private var §_-D2P§:§_-k2Q§ = null;
      
      private var §_-q1q§:§_-420§ = null;
      
      private var §_-xQ§:§_-DK§ = null;
      
      private var §_-Y1V§:§_-o2n§ = null;
      
      private var §_-I2N§:int = 0;
      
      private var §_-U26§:§_-01v§ = null;
      
      private var player:Player = null;
      
      private var §_-Q2L§:int = 0;
      
      private var §_-Q23§:int = -1;
      
      private var §_-E1g§:MovieClip = null;
      
      private var §_-z1N§:DisplayObject = null;
      
      private var §_-6n§:int = Hero.§_-PM§;
      
      private var §_-L13§:Boolean = false;
      
      private var §_-81k§:int = 0;
      
      private var §_-a12§:Number = 1;
      
      private var bubble:§_-aS§ = null;
      
      private var §_-yG§:* = null;
      
      private var §_-t1l§:§_-aS§ = new §_-aS§();
      
      private var §_-Bn§:Object = {};
      
      public function §_-c2W§(param1:int)
      {
         super();
         this.player = Game.getPlayer(param1);
         if(param1 == Game.selfId)
         {
            this.§_-12b§ = new §_-aS§(new SquirrellLighting());
            this.§_-12b§.§_-i18§();
            this.§_-12b§.y = -(this.§_-12b§.height / 2.5);
            getStarlingView().addChildAt(this.§_-12b§.getStarlingView(),0);
         }
         this.armature = §_-O1h§.§_-y1y§().§_-i2H§(§_-O1h§.§_-m11§);
         this.armature.addEventListener(§_-b2K§.§_-w1Q§,this.§_-q2S§);
         §_-p4§.§_-m1U§.add(this.armature);
         this.§_-Y1V§ = new §_-o2n§(this.armature);
         this.§_-t1h§.§_-J2J§(this.armature.display);
         this.§_-62p§ = new §_-u2§();
         this.§_-62p§.x = -30;
         this.§_-z2e§ = new §_-02D§();
         this.§_-z2e§.x = -30;
         this.§_-D2P§ = new §_-k2Q§();
         this.§_-D2P§.x = -30;
         this.§_-q1q§ = new §_-420§();
         this.§_-xQ§ = new §_-DK§();
         this.§_-xQ§.x = -10;
         §_-J2J§(this.§_-t1h§);
         §_-J2J§(this.§_-T2k§);
         §_-J2J§(this.§_-Y2N§);
         §_-J2J§(this.§_-Y2d§);
         this.§_-U26§ = new §_-01v§(param1);
         §_-J2J§(this.§_-U26§);
         this.§_-37§ = new §_-b2H§(this.§_-Y1g§);
         addChild(this.§_-37§);
         this.§_-gY§ = new §_-C17§();
         this.§_-gY§.x = -17;
         this.§_-gY§.visible = false;
         this.circle.touchable = false;
         this.circle.visible = false;
         this.circle.stop();
         this.§_-e1L§();
         this.mouseChildren = false;
         this.mouseEnabled = false;
      }
      
      override public function get alpha() : Number
      {
         if(!this.§_-t1h§)
         {
            return super.alpha;
         }
         if(this.player["id"] != Game.selfId)
         {
            return super.alpha;
         }
         return this.§_-t1h§.alpha;
      }
      
      override public function set alpha(param1:Number) : void
      {
         if(!this.§_-t1h§)
         {
            return;
         }
         if(this.player["id"] != Game.selfId)
         {
            super.alpha = param1;
         }
         this.§_-t1h§.alpha = param1;
         this.§_-Y2N§.alpha = param1;
         this.§_-T2k§.alpha = param1;
         this.§_-Y2d§.alpha = param1;
         this.§_-62p§.alpha = param1;
         this.§_-z2e§.alpha = param1;
         this.§_-D2P§.alpha = param1;
         this.§_-q1q§.alpha = param1;
         this.§_-xQ§.alpha = param1;
         if(this.viewAlternative != null)
         {
            this.viewAlternative.alpha = param1;
         }
         if(this.§_-Fx§)
         {
            this.§_-Fx§.alpha = param1;
         }
         if(this.§_-Jh§)
         {
            this.§_-Jh§.alpha = param1;
         }
         if(this.bubble)
         {
            this.bubble.alpha = param1;
         }
      }
      
      public function §_-S1C§(param1:String, param2:int, param3:int, param4:Boolean, param5:String = "") : void
      {
         if(param5.length > 0 && this.§_-U26§.§_-g1F§ == param5)
         {
            return;
         }
         this.§_-U26§.playerName = param1;
         this.§_-U26§.§_-M1d§ = param2;
         this.§_-U26§.league = param3;
         this.§_-U26§.§_-mI§ = param4;
         this.§_-U26§.§_-g1F§ = param5;
         this.§_-U26§.redraw();
         this.§_-Y1g§();
      }
      
      public function §_-72P§(param1:Boolean) : void
      {
         if(!this.armature)
         {
            return;
         }
         this.armature.§_-i2v§("Head").childArmature.§_-i2v§("Eye").§_-M1A§ = param1 ? "black" : null;
         this.armature.§_-i2v§("Head").childArmature.§_-i2v§("Mouth").§_-M1A§ = param1 ? "black" : null;
         if(!param1)
         {
            return;
         }
         this.armature.§_-i2v§("Head").childArmature.animation.gotoAndPlay("black");
      }
      
      public function remove() : void
      {
         this.player = null;
         if(this.circle)
         {
            this.circle.removeFromParent();
         }
         if(this.§_-yG§)
         {
            (this.§_-yG§ as §_-51g§).removeFromParent();
         }
         if(this.§_-Bn§["left"])
         {
            (this.§_-Bn§["left"] as §_-51g§).removeFromParent();
         }
         if(this.§_-Bn§["right"])
         {
            (this.§_-Bn§["right"] as §_-51g§).removeFromParent();
         }
         if(this.§_-w1L§)
         {
            this.§_-w1L§.removeFromParent(true);
         }
         this.§_-w1L§ = null;
         if(this.§_-Y1V§)
         {
            this.§_-Y1V§.remove();
         }
         this.§_-Y1V§ = null;
         if(this.scratView)
         {
            (this.scratView as §_-112§).remove();
         }
         this.scratView = null;
         if(Boolean(this.§_-T2k§) && this.§_-U2E§(this.§_-T2k§))
         {
            removeChildStarling(this.§_-T2k§,true);
         }
         this.§_-T2k§ = null;
         if(this.§_-t2V§)
         {
            (this.§_-t2V§ as §_-23o§).remove();
         }
         this.§_-t2V§ = null;
         if(Boolean(this.§_-Y2N§) && this.§_-U2E§(this.§_-Y2N§))
         {
            removeChildStarling(this.§_-Y2N§,true);
         }
         this.§_-Y2N§ = null;
         if(this.§_-R9§)
         {
            (this.§_-R9§ as §_-Pu§).remove();
         }
         this.§_-R9§ = null;
         if(Boolean(this.§_-Y2d§) && this.§_-U2E§(this.§_-Y2d§))
         {
            removeChildStarling(this.§_-Y2d§,true);
         }
         this.§_-Y2d§ = null;
         if(this.§_-U2E§(this.§_-q1q§))
         {
            removeChildStarling(this.§_-q1q§);
         }
         this.§_-q1q§.dispose();
         this.§_-q1q§ = null;
         if(this.contains(this.§_-xQ§))
         {
            removeChild(this.§_-xQ§);
         }
         if(this.§_-U2E§(this.§_-xQ§))
         {
            removeChildStarling(this.§_-xQ§);
         }
         this.§_-xQ§.dispose();
         this.§_-xQ§ = null;
         if(this.§_-U2E§(this.§_-z2e§))
         {
            removeChildStarling(this.§_-z2e§);
         }
         this.§_-z2e§.dispose();
         this.§_-z2e§ = null;
         if(this.§_-U2E§(this.§_-62p§))
         {
            removeChildStarling(this.§_-62p§);
         }
         this.§_-62p§.dispose();
         this.§_-62p§ = null;
         if(this.§_-U2E§(this.§_-D2P§))
         {
            removeChildStarling(this.§_-D2P§);
         }
         this.§_-D2P§.dispose();
         this.§_-D2P§ = null;
         if(this.contains(this.§_-U26§) || this.§_-U2E§(this.§_-U26§))
         {
            removeChildStarling(this.§_-U26§);
         }
         this.§_-U26§.dispose();
         this.§_-U26§ = null;
         if(this.§_-qz§)
         {
            this.§_-qz§.dispose();
            this.§_-qz§.removeFromParent();
         }
         this.§_-37§.dispose();
         this.§_-gY§.dispose();
         if(this.§_-Fx§)
         {
            if(this.§_-U2E§(this.§_-Fx§))
            {
               removeChildStarling(this.§_-Fx§);
            }
         }
         if(this.§_-Jh§)
         {
            this.§_-Jh§.remove();
            if(this.contains(this.§_-Jh§))
            {
               removeChild(this.§_-Jh§);
            }
         }
         if(this.bubble)
         {
            if(this.§_-U2E§(this.bubble))
            {
               this.bubble.removeFromParent();
               this.bubble = null;
            }
         }
         this.circle = null;
         this.§_-A3x§ = null;
         this.§_-Fx§ = null;
         this.bubble = null;
         §_-p4§.§_-m1U§.remove(this.armature);
         this.armature.dispose();
         this.armature = null;
         if(this.§_-U2E§(this.§_-t1h§))
         {
            removeChildStarling(this.§_-t1h§,false);
         }
         this.§_-t1h§ = null;
      }
      
      public function set §_-s23§(param1:Boolean) : void
      {
         if(param1)
         {
            if(!this.§_-E1g§)
            {
               this.§_-E1g§ = new GumStart();
            }
            this.§_-E1g§.y = -20;
            addChild(this.§_-E1g§);
            return;
         }
         if(Boolean(this.§_-E1g§) && Boolean(this.§_-E1g§.parent))
         {
            this.§_-E1g§.parent.removeChild(this.§_-E1g§);
         }
      }
      
      public function set immortal(param1:Boolean) : void
      {
         if(param1 && !this.bubble)
         {
            this.bubble = new §_-aS§(new ImmortalityBubble());
            this.§_-QR§();
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
      
      public function §_-X1I§(param1:DisplayObject) : void
      {
         if(Boolean(this.§_-z1N§) && Boolean(this.§_-z1N§.parent))
         {
            this.§_-z1N§.parent.removeChild(this.§_-z1N§);
         }
         this.§_-z1N§ = param1;
         if(param1 == null)
         {
            return;
         }
         this.§_-z1N§.y = this.topOffset;
         addChildAt(this.§_-z1N§,getChildIndex(this.§_-37§));
      }
      
      public function get §_-m1p§() : Boolean
      {
         return this.§_-L13§;
      }
      
      public function set §_-m1p§(param1:Boolean) : void
      {
         this.§_-L13§ = param1;
      }
      
      public function set §_-B2n§(param1:int) : void
      {
         if(!this.circle)
         {
            return;
         }
         this.circle.touchable = false;
         this.circle.gotoAndStop(int(param1 * this.circle.totalFrames / 100));
      }
      
      public function get §_-dU§() : Boolean
      {
         return this.§_-Q25§;
      }
      
      public function set §_-dU§(param1:Boolean) : void
      {
         if(this.§_-Q25§ == param1)
         {
            return;
         }
         this.§_-Q25§ = param1;
         this.update();
      }
      
      public function get §_-f29§() : §_-01v§
      {
         return this.§_-U26§;
      }
      
      public function get §_-P1K§() : §_-K1G§
      {
         return this.§_-qz§;
      }
      
      public function set §_-P1K§(param1:§_-K1G§) : void
      {
         this.§_-qz§ = param1;
         this.§_-qz§.x = -30;
         §_-J2J§(this.§_-qz§);
         this.§_-Y1g§();
      }
      
      public function sendMessage(param1:String, param2:int = 5000) : void
      {
         this.§_-gY§.remove();
         this.§_-37§.remove(true);
         if(param1)
         {
            this.§_-37§.§_-33§(param1,param2);
         }
      }
      
      public function §_-f2g§(param1:int) : void
      {
         this.§_-37§.remove();
         this.§_-gY§.remove();
         this.§_-gY§.emotion = param1;
         addChild(this.§_-gY§);
      }
      
      public function set dead(param1:Boolean) : void
      {
         if(this.isDead == param1)
         {
            return;
         }
         this.isDead = param1;
         if(this.§_-U26§)
         {
            this.§_-U26§.visible = !param1;
         }
         if(this.§_-62p§)
         {
            this.§_-62p§.visible = !param1;
         }
         if(this.§_-A3x§)
         {
            this.§_-A3x§.visible = !param1;
         }
         if(this.§_-Fx§)
         {
            this.§_-Fx§.visible = !param1;
         }
         if(this.§_-Jh§)
         {
            this.§_-Jh§.visible = !param1;
            if(this.§_-Jh§.visible)
            {
               this.§_-Jh§.play();
            }
            else
            {
               this.§_-Jh§.stop();
            }
         }
         if(this.bubble)
         {
            this.bubble.visible = !param1;
         }
         if(this.isDead)
         {
            this.§_-j1R§();
            this.§_-91w§();
         }
         this.update();
      }
      
      public function get dead() : Boolean
      {
         return this.isDead;
      }
      
      public function get §_-62F§() : Boolean
      {
         return this.§_-j2Q§;
      }
      
      public function set §_-62F§(param1:Boolean) : void
      {
         if(this.§_-t2V§)
         {
            (this.§_-t2V§ as §_-23o§).§_-2I§ = param1;
         }
         if(this.scratView)
         {
            (this.scratView as §_-112§).§_-2I§ = param1;
         }
         if(this.§_-R9§)
         {
            (this.§_-R9§ as §_-Pu§).§_-2I§ = param1;
         }
         if(this.§_-j2Q§ == param1)
         {
            return;
         }
         this.§_-j2Q§ = param1;
         this.armature.§_-i2v§(§_-Xw§).§_-M1A§ = param1 ? §_-Xw§ : null;
         this.armature.§_-i2v§(§_-eD§).§_-M1A§ = param1 ? §_-Xw§ : null;
         if(!param1)
         {
            return;
         }
         this.armature.animation.gotoAndPlay(§_-Xw§,-1,-1,NaN,0,§_-Xw§,"sameGroup");
         this.armature.§_-j2c§();
         §_-p4§.§_-m1U§.§_-a1Q§(§_-p1V§.delay);
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
         if(this.§_-Y1V§ != null)
         {
            this.§_-Y1V§.clear();
         }
         this.§_-52j§ = false;
         var _loc3_:Array = [];
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < param1.length)
         {
            if(§_-P2x§.§_-k1G§(param1[_loc5_]))
            {
               _loc4_.push(param1[_loc5_]);
            }
            else if(!§_-P2x§.§_-r5§(param1[_loc5_]) && !§_-P2x§.§_-e2S§(param1[_loc5_]))
            {
               _loc3_.push(param1[_loc5_]);
               this.§_-52j§ = this.§_-52j§ || §_-P2x§.§_-Sj§(param1[_loc5_]);
            }
            _loc5_++;
         }
         if(_loc4_.length == 0)
         {
            _loc4_.push(§_-P2x§.§_-c1n§);
         }
         if(this.§_-Y1V§ != null)
         {
            this.§_-Y1V§.§_-533§(this.shaman ? _loc4_ : _loc3_,this.shaman ? null : param2);
         }
         if(this.scratView)
         {
            (this.scratView as §_-112§).setClothing(param1);
         }
         this.update();
         this.§_-Y1g§();
         if(this.visible)
         {
            this.§_-I14§();
         }
      }
      
      public function get emotion() : Boolean
      {
         return this.§_-a1v§;
      }
      
      public function get §_-n1e§() : int
      {
         return this.§_-Q2L§;
      }
      
      public function §_-73j§(param1:int) : void
      {
         if(this.emotion && this.§_-Q2L§ == param1 || this.§_-52A§ || this.running)
         {
            return;
         }
         if(param1 >= Hero.§_-113§)
         {
            return;
         }
         this.§_-a1v§ = true;
         this.§_-Q2L§ = param1;
         this.§_-W2f§ = true;
         this.§_-72P§(false);
         this.update();
      }
      
      public function §_-Ks§() : void
      {
         this.§_-a1v§ = false;
         if(this.§_-t2V§)
         {
            (this.§_-t2V§ as §_-23o§).laugh = false;
         }
         this.§_-72P§(this.§_-6n§ == Hero.§_-m28§);
         this.update();
      }
      
      public function get shaman() : Boolean
      {
         return this.§_-C1F§;
      }
      
      public function set shaman(param1:Boolean) : void
      {
         if(this.§_-C1F§ == param1)
         {
            return;
         }
         if(this.§_-Y1V§ != null)
         {
            this.§_-Y1V§.clear();
         }
         this.§_-C1F§ = param1;
         if(this.§_-A3x§)
         {
            this.§_-A3x§.visible = !param1;
         }
         if(!param1)
         {
            if(this.player["worn"] != null)
            {
               this.setClothing(this.player["worn_packages"],this.player["worn_accessories"]);
            }
            this.§_-72P§(false);
         }
         else
         {
            this.§_-7U§();
         }
         this.§_-U26§.shaman = param1;
         this.§_-Y1g§();
         this.§_-t1h§.visible = !this.hare && !this.dragon && (this.shaman || !(this.scrat && this.§_-216§));
         this.§_-T2k§.visible = !this.hare && !this.shaman && !this.dragon && Boolean(this.scrat) && this.§_-216§;
         this.§_-Y2d§.visible = !this.hare && !this.shaman && !this.scrat && Boolean(this.dragon);
         this.update();
         if(this.visible)
         {
            this.§_-I14§();
         }
      }
      
      public function §_-DG§(param1:Boolean) : void
      {
         if(Boolean(this.§_-M1R§) && !param1)
         {
            this.§_-M1R§.removeFromParent();
            this.§_-M1R§ = null;
         }
         if(param1 && !this.§_-M1R§)
         {
            this.§_-M1R§ = new §_-aS§(new ArrowMovie());
            this.§_-M1R§.rotation = -90;
            this.§_-M1R§.x = -13;
            this.§_-M1R§.y -= this.§_-M1R§.height + this.§_-U26§.height * 0.5;
            this.§_-J2J§(this.§_-M1R§);
         }
      }
      
      public function get team() : int
      {
         return this.§_-6n§;
      }
      
      public function set team(param1:int) : void
      {
         if(this.§_-6n§ == param1)
         {
            return;
         }
         this.§_-6n§ = param1;
         if(this.shaman)
         {
            this.§_-7U§();
         }
         this.§_-U26§.team = param1;
         this.update();
      }
      
      public function get running() : Boolean
      {
         return this.§_-fB§;
      }
      
      public function set running(param1:Boolean) : void
      {
         if(this.§_-fB§ == param1)
         {
            return;
         }
         this.§_-fB§ = param1;
         if(param1)
         {
            this.§_-a1v§ = false;
         }
      }
      
      public function get direction() : Boolean
      {
         return this.§_-E2n§;
      }
      
      public function set direction(param1:Boolean) : void
      {
         if(this.§_-E2n§ == param1)
         {
            return;
         }
         this.§_-E2n§ = param1;
         this.armature.display.scaleX = (param1 ? 1 : -1) * Math.abs(this.armature.display.scaleX);
         this.§_-Y2N§.getStarlingView().scaleX = (param1 ? 1 : -1) * Math.abs(this.§_-Y2N§.getStarlingView().scaleX);
         this.§_-T2k§.getStarlingView().scaleX = (param1 ? 1 : -1) * Math.abs(this.§_-T2k§.getStarlingView().scaleX);
         this.§_-Y2d§.getStarlingView().scaleX = (param1 ? 1 : -1) * Math.abs(this.§_-Y2d§.getStarlingView().scaleX);
         if(Boolean(this.viewAlternative) && this.§_-13t§)
         {
            this.viewAlternative.scaleX = (param1 ? 1 : -1) * Math.abs(this.viewAlternative.scaleX);
         }
      }
      
      public function get §_-52A§() : Boolean
      {
         return this.§_-vo§;
      }
      
      public function set §_-52A§(param1:Boolean) : void
      {
         if(this.§_-vo§ == param1)
         {
            return;
         }
         this.§_-vo§ = param1;
         if(param1)
         {
            this.§_-a1v§ = false;
         }
      }
      
      public function update() : void
      {
         if(this.§_-w1L§)
         {
            this.§_-w1L§.visible = this.dead && !this.shaman && !this.§_-m1p§;
         }
         if(Boolean(this.armature) && Boolean(this.armature.display))
         {
            this.armature.display.visible = !this.dead;
         }
         if(this.§_-a§ != this.state || Boolean(this.§_-a§ == this.state && this.state == Hero.§_-pq§) && Boolean(this.§_-W2f§))
         {
            this.§_-I14§();
         }
         if(Boolean(this.§_-12b§) && this.§_-Q23§ != §_-y27§.highlight)
         {
            this.§_-Q23§ = §_-y27§.highlight;
            this.§_-12b§.alpha = this.§_-Q23§ * 0.4;
         }
      }
      
      public function §_-67§(param1:Number) : void
      {
         var _loc2_:String = null;
         var _loc3_:§_-83b§ = null;
         for each(_loc2_ in ["Head","Cap","Cap_accessory","Glasses"])
         {
            _loc3_ = this.armature.§_-i2v§(_loc2_);
            _loc3_.§_-v2x§.scaleX = _loc3_.§_-v2x§.scaleY = param1;
         }
      }
      
      public function set scale(param1:Number) : void
      {
         if(this.§_-a12§ == param1)
         {
            return;
         }
         this.§_-a12§ = param1;
         this.scaleY = param1;
         this.scaleX = (this.scaleX ? 1 : -1) * Math.abs(this.scaleY);
         this.y = param1 < 1 ? Hero.§_-a1A§ * param1 : Hero.§_-a1A§;
         this.§_-37§.scaleX = this.§_-37§.scaleY = this.scaleY;
         if(this.§_-Fx§)
         {
            this.§_-Fx§.scaleX = this.§_-Fx§.scaleY = this.scaleY;
         }
         if(this.§_-Jh§)
         {
            this.§_-Jh§.scaleX = this.§_-Jh§.scaleY = this.scaleY;
         }
         this.§_-QR§();
         this.§_-Y1g§();
      }
      
      public function §_-v2L§(param1:SimpleButton, param2:int, param3:Boolean = true) : void
      {
         this.§_-62p§.play(param1,param2,param3);
         §_-J2J§(this.§_-62p§);
      }
      
      public function §_-C1X§(param1:SimpleButton, param2:Boolean = true) : void
      {
         this.§_-z2e§.play(param1,0,param2);
         §_-J2J§(this.§_-z2e§);
      }
      
      public function §_-515§() : void
      {
         this.§_-62p§.stop();
      }
      
      public function §_-A2l§() : void
      {
         this.§_-z2e§.§_-R1s§();
      }
      
      public function §_-YN§(param1:int, param2:int, param3:int = 0) : void
      {
         this.§_-D2P§.§_-EL§(param1,param2,param3);
         if(this.§_-U2E§(this.§_-D2P§))
         {
            removeChildStarling(this.§_-D2P§,false);
         }
         this.§_-D2P§.scaleXY(1);
         §_-J2J§(this.§_-D2P§);
      }
      
      public function §_-G14§() : void
      {
         removeChildStarling(this.§_-D2P§);
      }
      
      public function §_-Y15§(param1:MovieClip) : void
      {
         this.§_-q1q§.view = param1;
         this.§_-q1q§.§_-EL§(0,0,§_-ZP§.§_-Q1U§);
         if(this.§_-U2E§(this.§_-q1q§))
         {
            removeChildStarling(this.§_-q1q§,false);
         }
         this.§_-q1q§.scaleXY(1);
         §_-J2J§(this.§_-q1q§);
      }
      
      public function §_-83Z§(param1:Hero, param2:int) : void
      {
         this.§_-xQ§.§_-M19§(param1,param2);
         if(this.§_-U2E§(this.§_-xQ§))
         {
            removeChildStarling(this.§_-xQ§,false);
         }
         this.§_-xQ§.scaleXY(1);
         §_-J2J§(this.§_-xQ§);
      }
      
      public function §_-k1I§() : void
      {
         if(!this.§_-Fx§)
         {
            this.§_-Fx§ = new §_-f1u§(new ActiveAura());
            this.§_-Fx§.loop = false;
         }
         else if(this.§_-U2E§(this.§_-Fx§))
         {
            removeChildStarling(this.§_-Fx§,false);
         }
         this.§_-Fx§.scaleXY(1);
         this.§_-Fx§.§_-i18§();
         this.§_-Fx§.x = 0;
         this.§_-Fx§.y = -20;
         this.§_-Fx§.gotoAndPlay(0);
         §_-J2J§(this.§_-Fx§);
      }
      
      public function §_-e1z§() : void
      {
         if(this.§_-81k§++)
         {
            return;
         }
         if(!this.§_-Jh§)
         {
            this.§_-Jh§ = new §_-h25§(new PassiveAura());
            this.§_-Jh§.x = -25;
            this.§_-Jh§.y = -30;
         }
         this.§_-Jh§.play();
         addChild(this.§_-Jh§);
      }
      
      public function §_-d2§() : void
      {
         if(this.§_-81k§ == 0 || !this.§_-Jh§)
         {
            return;
         }
         --this.§_-81k§;
         if(this.§_-81k§ != 0)
         {
            return;
         }
         this.§_-Jh§.stop();
         if(contains(this.§_-Jh§))
         {
            removeChild(this.§_-Jh§);
         }
      }
      
      public function §_-91w§(param1:Sprite = null, param2:Boolean = true) : void
      {
         if(this.§_-t1h§ == null)
         {
            return;
         }
         this.§_-13t§ = param2;
         if(Boolean(this.viewAlternative) && this.contains(this.viewAlternative))
         {
            removeChild(this.viewAlternative);
         }
         if(this.viewAlternative is §_-aS§ && this.§_-U2E§(this.viewAlternative))
         {
            removeChildStarling(this.viewAlternative,false);
         }
         if(param1 == null)
         {
            this.§_-Y2N§.visible = Boolean(this.isHare);
            this.§_-t1h§.visible = !this.hare && !this.dragon && (this.shaman || !(this.scrat && this.§_-216§));
            this.§_-T2k§.visible = !this.hare && !this.shaman && !this.dragon && Boolean(this.scrat) && this.§_-216§;
            this.§_-Y2d§.visible = Boolean(this.dragon);
            return;
         }
         this.§_-U26§.visible = true;
         this.§_-t1h§.visible = false;
         this.§_-Y2N§.visible = false;
         this.§_-T2k§.visible = false;
         this.§_-Y2d§.visible = false;
         this.viewAlternative = param1;
         if(this.§_-13t§)
         {
            this.viewAlternative.scaleX = (this.direction ? 1 : -1) * Math.abs(this.scaleX);
         }
         this.viewAlternative.alpha = this.§_-t1h§.alpha;
         addChildAt(this.viewAlternative,1);
         if(this.viewAlternative is §_-aS§)
         {
            §_-J2J§(this.viewAlternative);
         }
         this.§_-Y1g§();
      }
      
      public function §_-s28§(param1:DisplayObject, param2:Boolean = false, param3:Boolean = true) : void
      {
         if(Boolean(this.viewAlternative) && this.contains(this.viewAlternative))
         {
            removeChild(this.viewAlternative);
         }
         if(this.§_-Y2N§)
         {
            this.§_-Y2N§.visible = false;
         }
         this.viewAlternative = param1 as Sprite;
         if(Boolean(this.viewAlternative) && Boolean(param1))
         {
            if(param3)
            {
               this.viewAlternative.scaleX = (this.direction ? 1 : -1) * Math.abs(this.scaleX);
            }
            this.viewAlternative.alpha = this.§_-t1h§ ? this.§_-t1h§.alpha : 0;
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
         if(!this.§_-t2V§ && Boolean(param1))
         {
            this.§_-t2V§ = new §_-23o§();
            (this.§_-t2V§ as §_-23o§).§_-2I§ = this.§_-62F§;
            this.§_-Y2N§.§_-J2J§(this.§_-t2V§);
         }
         this.hare = param1;
         this.§_-Y2N§.visible = Boolean(param1);
         this.§_-t1h§.visible = !this.hare && !this.dragon && (this.shaman || !(this.scrat && this.§_-216§));
         this.§_-T2k§.visible = !this.hare && !this.shaman && !this.dragon && Boolean(this.scrat) && this.§_-216§;
         this.§_-Y2d§.visible = Boolean(this.dragon);
         this.§_-Y1g§();
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
               _loc2_ ||= §_-P2x§.§_-r5§(this.player["worn_packages"][_loc3_]);
               _loc3_++;
            }
            this.scratView = new §_-112§(_loc2_);
            (this.scratView as §_-112§).§_-2I§ = this.§_-62F§;
            this.§_-T2k§.§_-J2J§(this.scratView);
         }
         this.scrat = param1;
         this.§_-Y2N§.visible = Boolean(this.hare);
         this.§_-t1h§.visible = !this.hare && !this.dragon && (this.shaman || !(param1 && this.§_-216§));
         this.§_-T2k§.visible = !this.hare && !this.shaman && !this.dragon && this.§_-216§ && param1;
         this.§_-Y2d§.visible = Boolean(this.dragon);
         this.§_-Y1g§();
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
         if(!this.§_-R9§ && Boolean(param1))
         {
            this.§_-R9§ = new §_-Pu§();
            (this.§_-R9§ as §_-Pu§).§_-2I§ = this.§_-62F§;
            this.§_-Y2d§.§_-J2J§(this.§_-R9§);
         }
         this.dragon = param1;
         this.§_-Y2N§.visible = Boolean(this.hare);
         this.§_-t1h§.visible = !this.hare && !this.dragon && (this.shaman || !(this.scrat && this.§_-216§));
         this.§_-T2k§.visible = !this.hare && !this.shaman && !this.dragon && Boolean(this.scrat) && this.§_-216§;
         this.§_-Y2d§.visible = Boolean(this.dragon);
         this.§_-Y1g§();
         if(Boolean(param1) && Boolean(this.viewAlternative) && this.contains(this.viewAlternative))
         {
            removeChild(this.viewAlternative);
         }
      }
      
      public function set §_-I2s§(param1:Boolean) : void
      {
         this.§_-216§ = param1;
         this.§_-T2k§.visible = !this.hare && !this.shaman && !this.dragon && Boolean(this.scrat) && this.§_-216§;
         this.§_-t1h§.visible = !this.hare && !this.dragon && (this.shaman || !(this.scrat && this.§_-216§));
      }
      
      public function get §_-FH§() : int
      {
         if(this.shaman)
         {
            return §_-i2§;
         }
         if(this.isScrat)
         {
            return §_-b1k§;
         }
         if(this.isDragon)
         {
            return §_-31M§;
         }
         if(this.isHare)
         {
            return §_-o28§;
         }
         if(Boolean(this.viewAlternative) && this.viewAlternative.name == "Vendigo")
         {
            return §_-F1i§;
         }
         if(Boolean(this.viewAlternative) && this.viewAlternative.name == "SnowLeopard")
         {
            return §_-v2D§;
         }
         if(Boolean(this.viewAlternative) && this.viewAlternative.name == "WildBoar")
         {
            return §_-v2D§;
         }
         if(Boolean(this.viewAlternative) && this.viewAlternative.name == "WildHog")
         {
            return §_-v2D§;
         }
         if(Boolean(this.viewAlternative) && this.viewAlternative.name == "ClothesFlightView")
         {
            return §_-36§;
         }
         return §_-536§;
      }
      
      public function get topOffset() : int
      {
         return this.§_-I2N§;
      }
      
      private function §_-Y1g§() : void
      {
         this.§_-U26§.y = this.§_-FH§ - 5;
         var _loc1_:Number = this.§_-U26§.height > 0 ? this.§_-U26§.height : 5;
         if(this.§_-qz§)
         {
            this.§_-qz§.y = this.§_-FH§ - _loc1_;
            this.§_-37§.y = this.§_-qz§.y - this.§_-qz§.height - this.§_-37§.height;
         }
         else
         {
            this.§_-37§.y = this.§_-FH§ - _loc1_ - this.§_-37§.height;
         }
         this.§_-I2N§ = this.§_-37§.y - 3;
         this.§_-gY§.y = this.§_-I2N§;
         this.§_-62p§.y = this.§_-I2N§;
         this.§_-z2e§.y = this.§_-I2N§;
         this.§_-D2P§.y = this.§_-I2N§;
         this.§_-xQ§.y = this.§_-I2N§;
         this.§_-q1q§.y = this.§_-I2N§;
      }
      
      private function §_-QR§() : void
      {
         if(this.bubble)
         {
            this.bubble.y = -33 * this.§_-a12§;
         }
      }
      
      private function §_-e1L§() : void
      {
         var _loc1_:§_-83b§ = this.armature.§_-i2v§("Head");
         var _loc2_:§_-z2H§ = §_-O1h§.§_-73U§();
         var _loc3_:§_-aS§ = new §_-aS§();
         this.§_-yG§ = new §_-f1u§(new KissHearts());
         this.§_-yG§.x = 25;
         this.§_-yG§.y = 72;
         this.§_-yG§.loop = false;
         this.§_-yG§.stop();
         _loc3_.§_-J2J§(this.§_-yG§.getStarlingView());
         _loc2_.display = _loc3_.getStarlingView();
         _loc2_.§_-x1D§.copy(_loc1_.§_-x1D§);
         _loc2_.zOrder = this.armature.§_-KY§().length + 1;
         _loc1_.addChild(_loc2_);
         this.§_-Bn§["left"] = new §_-f1u§(new ShamTears());
         this.§_-Bn§["left"].scaleX *= -1;
         this.§_-Bn§["left"].x = 7;
         this.§_-Bn§["left"].y = 32;
         this.§_-Bn§["left"].stop();
         this.§_-t1l§.§_-J2J§(this.§_-Bn§["left"].getStarlingView());
         this.§_-Bn§["right"] = new §_-f1u§(new ShamTears());
         this.§_-Bn§["right"].x = -5;
         this.§_-Bn§["right"].y = 31;
         this.§_-Bn§["right"].stop();
         this.§_-t1l§.§_-J2J§(this.§_-Bn§["right"].getStarlingView());
         _loc2_ = §_-O1h§.§_-73U§();
         _loc2_.display = this.§_-t1l§.getStarlingView();
         _loc2_.§_-x1D§.copy(_loc1_.§_-x1D§);
         _loc2_.§_-v2x§.rotation = -0.2;
         _loc2_.zOrder = this.armature.§_-KY§().length + 1;
         _loc1_.addChild(_loc2_);
         this.§_-yG§.visible = this.§_-t1l§.visible = false;
      }
      
      private function §_-j1R§() : void
      {
         if(Boolean(this.§_-w1L§) || !this.§_-t1h§)
         {
            return;
         }
         var _loc1_:Class = getDefinitionByName("HeroDead") as Class;
         if(_loc1_ == null)
         {
            return;
         }
         this.§_-w1L§ = new §_-f1u§(new _loc1_());
         this.§_-w1L§.x = -30;
         this.§_-w1L§.y = -150;
         this.§_-w1L§.blendMode = BlendMode.SCREEN;
         this.§_-w1L§.loop = false;
         this.§_-t1h§.§_-J2J§(this.§_-w1L§);
      }
      
      private function get state() : int
      {
         if(!this.visible)
         {
            return Hero.§_-72g§;
         }
         if(this.dead)
         {
            return Hero.§_-mM§;
         }
         if(this.§_-Q25§)
         {
            return Hero.§_-134§;
         }
         if(this.§_-52A§)
         {
            return Hero.§_-l19§;
         }
         if(this.running)
         {
            return Hero.§_-b1i§;
         }
         if(this.emotion)
         {
            return Hero.§_-pq§;
         }
         return Hero.§_-h1o§;
      }
      
      private function §_-I14§() : void
      {
         var _loc1_:String = null;
         this.§_-a§ = this.state;
         if(Boolean(this.§_-t2V§) && !this.§_-t1h§.visible)
         {
            (this.§_-t2V§ as §_-23o§).setState(this.state);
         }
         if(Boolean(this.§_-R9§) && !this.§_-t1h§.visible)
         {
            (this.§_-R9§ as §_-Pu§).setState(this.state);
         }
         if(Boolean(this.scratView) && !this.§_-t1h§.visible)
         {
            (this.scratView as §_-112§).setState(this.state);
         }
         if(Boolean(this.viewAlternative) && this.viewAlternative is §_-y4§)
         {
            (this.viewAlternative as §_-y4§).setState(this.state);
         }
         if(this.§_-yG§)
         {
            this.§_-yG§.visible = false;
         }
         if(this.§_-t1l§)
         {
            this.§_-t1l§.visible = false;
         }
         if(this.§_-Bn§["right"])
         {
            this.§_-Bn§["right"].stop();
         }
         if(this.§_-Bn§["left"])
         {
            this.§_-Bn§["left"].stop();
         }
         switch(this.state)
         {
            case Hero.§_-mM§:
               if(Boolean(this.§_-m1p§) || Boolean(this.§_-Y2N§ && this.§_-t2V§ && this.§_-Y2N§.visible) || Boolean(this.§_-T2k§ && this.scratView) && Boolean(this.§_-T2k§.visible) || Boolean(this.§_-Y2d§ && this.§_-R9§) && Boolean(this.§_-Y2d§.visible))
               {
                  break;
               }
               if(this.§_-w1L§)
               {
                  this.§_-w1L§.gotoAndPlay(1);
               }
               break;
            case Hero.§_-pq§:
               this.§_-W2f§ = false;
               if(Boolean(this.§_-Y2N§) && Boolean(this.§_-t2V§) && this.§_-Y2N§.visible)
               {
                  (this.§_-t2V§ as §_-23o§).laugh = true;
                  break;
               }
               _loc1_ = "";
               switch(this.§_-n1e§)
               {
                  case Hero.§_-YX§:
                     _loc1_ = Hero.§_-O2g§;
                     break;
                  case Hero.§_-A1D§:
                     _loc1_ = Hero.§_-H1v§;
                     break;
                  case Hero.§_-o1K§:
                     _loc1_ = Hero.§_-63C§;
                     if(this.§_-t1l§)
                     {
                        this.§_-t1l§.visible = true;
                     }
                     if(this.§_-Bn§["right"])
                     {
                        this.§_-Bn§["right"].play();
                     }
                     if(this.§_-Bn§["left"])
                     {
                        this.§_-Bn§["left"].play();
                     }
                     break;
                  case Hero.§_-C37§:
                     _loc1_ = Hero.§_-O1a§;
               }
               if(Boolean(this.armature) && Boolean(this.armature.animation) && _loc1_ != "")
               {
                  this.armature.animation.gotoAndPlay(_loc1_);
               }
               break;
            case Hero.§_-72g§:
               this.§_-a§ = this.state;
               if(Boolean(this.armature) && Boolean(this.armature.animation))
               {
                  this.armature.animation.stop();
               }
               break;
            default:
               if(this.state in Hero.§_-p2Z§)
               {
                  switch(this.state)
                  {
                     case Hero.§_-134§:
                        if(this.armature)
                        {
                           if(this.§_-91s§ == §_-G2w§)
                           {
                              this.armature.animation.gotoAndPlay(Hero.§_-S1k§);
                           }
                           else
                           {
                              this.armature.animation.gotoAndPlay(Hero.§_-p2Z§[this.state]);
                           }
                           break;
                        }
                     case Hero.§_-b1i§:
                     case Hero.§_-l19§:
                        if(Boolean(this.armature) && Boolean(this.armature.animation))
                        {
                           if(this.§_-52j§ && !this.shaman)
                           {
                              this.armature.animation.gotoAndPlay(Hero.§_-z1s§);
                           }
                           else
                           {
                              this.armature.animation.gotoAndPlay(Hero.§_-p2Z§[this.state]);
                           }
                           break;
                        }
                     default:
                        if(Boolean(this.armature) && Boolean(this.armature.animation))
                        {
                           this.armature.animation.gotoAndPlay(Hero.§_-p2Z§[this.state]);
                        }
                  }
               }
         }
      }
      
      private function §_-7U§() : void
      {
         var shamanClothes:Array = null;
         switch(this.team)
         {
            case Hero.§_-i1Y§:
               this.setClothing([§_-P2x§.§_-c1n§]);
               break;
            case Hero.§_-l1B§:
               this.setClothing([§_-P2x§.§_-L10§]);
               break;
            case Hero.§_-m28§:
               this.setClothing([§_-P2x§.§_-H1g§]);
               this.§_-72P§(true);
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
                     return §_-P2x§.§_-VD§(param1) == §_-P2x§.§_-o2O§;
                  });
               }
               if(shamanClothes.length == 0)
               {
                  this.setClothing([§_-P2x§.§_-c1n§]);
               }
               else
               {
                  this.setClothing(shamanClothes);
               }
               this.§_-91s§ = §_-P2x§.§_-52q§(shamanClothes[0]);
         }
      }
      
      private function §_-q2S§(param1:§_-b2K§) : void
      {
         if(param1.frameLabel != §_-E2f§)
         {
            return;
         }
         this.§_-yG§.visible = true;
         this.§_-yG§.gotoAndPlay(0);
      }
   }
}

