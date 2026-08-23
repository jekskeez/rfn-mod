package
{
   import §_-AY§.§_-o2n§;
   import §_-R11§.§_-ns§;
   import §_-TK§.§_-aS§;
   import §_-TK§.§_-f1u§;
   import §_-Vu§.§_-h25§;
   import §_-Vu§.§_-p4§;
   import §_-X1k§.§_-P2x§;
   import §_-s2e§.§_-O1h§;
   import dragonBones.§_-833§;
   import flash.display.BlendMode;
   import flash.utils.getDefinitionByName;
   import starling.textures.§_-RS§;
   import utils.§_-y4§;
   
   public class §_-112§ extends §_-aS§ implements §_-y4§
   {
      
      private static const §_-Xw§:String = "acorn";
      
      public static const §_-V2J§:String = "acornLover";
      
      public static const §_-6B§:String = "acornLoverHand";
      
      private var §_-q2N§:Boolean = false;
      
      private var §_-D2k§:int = -2;
      
      private var §_-z18§:Boolean = true;
      
      private var §_-f2k§:§_-f1u§ = null;
      
      private var §_-Y1V§:§_-o2n§ = null;
      
      private var §_-t1h§:§_-aS§ = new §_-aS§();
      
      private var §_-yG§:§_-f1u§;
      
      public var armature:§_-833§;
      
      public function §_-112§(param1:Boolean = true)
      {
         super();
         this.§_-z18§ = param1;
         this.§_-g2s§();
         this.setState(Hero.§_-72g§);
      }
      
      public function remove() : void
      {
         if(this.§_-f2k§)
         {
            this.§_-f2k§.removeFromParent(true);
         }
         this.§_-f2k§ = null;
         if(this.§_-yG§)
         {
            this.§_-yG§.removeFromParent(true);
         }
         this.§_-yG§ = null;
         if(this.§_-Y1V§)
         {
            this.§_-Y1V§.remove();
         }
         this.§_-Y1V§ = null;
         §_-p4§.§_-m1U§.remove(this.armature);
         this.armature.dispose();
         this.armature = null;
         if(this.§_-U2E§(this.§_-t1h§))
         {
            removeChildStarling(this.§_-t1h§,false);
         }
         this.§_-t1h§ = null;
      }
      
      public function get state() : int
      {
         return this.§_-D2k§;
      }
      
      public function setState(param1:int, param2:int = 0) : void
      {
         if(this.§_-D2k§ == param1 && param1 == Hero.§_-72g§)
         {
            return;
         }
         this.§_-D2k§ = param1;
         if(this.§_-f2k§)
         {
            this.§_-f2k§.stop();
            this.§_-f2k§.visible = false;
         }
         if(param1 == Hero.§_-72g§)
         {
            return;
         }
         switch(this.§_-D2k§)
         {
            case Hero.§_-mM§:
               this.§_-X2D§();
               this.§_-f2k§.gotoAndPlay(0);
               this.§_-f2k§.visible = true;
               this.§_-t1h§.visible = false;
               break;
            default:
               this.§_-t1h§.visible = true;
               this.armature.animation.gotoAndPlay(Hero.§_-p2Z§[this.state]);
         }
      }
      
      public function get §_-2I§() : Boolean
      {
         return this.§_-q2N§;
      }
      
      public function set §_-2I§(param1:Boolean) : void
      {
         this.§_-q2N§ = param1;
         this.armature.§_-i2v§(§_-Xw§).§_-M1A§ = param1 ? §_-Xw§ : null;
         if(!param1)
         {
            return;
         }
         this.armature.animation.gotoAndPlay(§_-Xw§,-1,-1,NaN,0,§_-Xw§,§_-h25§.§_-fX§);
         this.armature.§_-j2c§();
         §_-p4§.§_-m1U§.§_-a1Q§(§_-p1V§.delay);
      }
      
      public function setClothing(param1:Array) : void
      {
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            if(this.§_-z18§ ? §_-P2x§.§_-r5§(param1[_loc3_]) : §_-P2x§.§_-e2S§(param1[_loc3_]))
            {
               _loc2_.push(param1[_loc3_]);
            }
            _loc3_++;
         }
         if(_loc2_.length == 0)
         {
            return;
         }
         this.§_-Y1V§.§_-533§(_loc2_);
         this.§_-A2z§();
      }
      
      public function get §_-Q2f§() : Array
      {
         if(this.§_-Y1V§ == null)
         {
            return [];
         }
         return this.§_-Y1V§.§_-Th§();
      }
      
      private function §_-g2s§() : void
      {
         this.armature = §_-O1h§.§_-y1y§().§_-i2H§(this.§_-z18§ ? §_-O1h§.§_-rR§ : §_-O1h§.§_-b2N§);
         §_-p4§.§_-m1U§.add(this.armature);
         this.§_-Y1V§ = new §_-o2n§(this.armature);
         this.§_-t1h§.§_-J2J§(this.armature.display);
         §_-J2J§(this.§_-t1h§);
         this.§_-A2z§();
         this.§_-o1q§();
      }
      
      private function §_-X2D§() : void
      {
         if(this.§_-f2k§)
         {
            return;
         }
         var _loc1_:Class = getDefinitionByName("HeroDead") as Class;
         this.§_-f2k§ = new §_-f1u§(new _loc1_());
         this.§_-f2k§.x = 60;
         this.§_-f2k§.y = -150;
         this.§_-f2k§.blendMode = BlendMode.SCREEN;
         this.§_-f2k§.loop = false;
         this.§_-f2k§.stop();
         §_-J2J§(this.§_-f2k§);
      }
      
      public function showHearts(param1:Boolean) : void
      {
         this.§_-yG§.loop = param1;
         this.§_-yG§.visible = param1;
         if(param1)
         {
            this.§_-yG§.play();
         }
         else
         {
            this.§_-yG§.stop();
         }
      }
      
      private function §_-o1q§() : void
      {
         this.§_-yG§ = new §_-f1u§(new AcornShareView());
         this.§_-yG§.loop = true;
         this.§_-yG§.visible = false;
         this.§_-yG§.stop();
         §_-J2J§(this.§_-yG§.getStarlingView());
      }
      
      private function §_-A2z§() : void
      {
         §_-ns§.§_-s2E§(this.armature,§_-RS§.§_-ww§,["Tail","innerHead"]);
      }
   }
}

