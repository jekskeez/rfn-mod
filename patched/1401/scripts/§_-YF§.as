package
{
   import §_-53U§.§_-r1H§;
   import §_-68§.§_-M10§;
   import §_-82O§.§_-92W§;
   import §_-I10§.§_-g2W§;
   import §_-N14§.§_-i2C§;
   import §_-N14§.§_-w2t§;
   import §_-RI§.§_-d2d§;
   import §_-RI§.§_-h2I§;
   import dragonBones.§_-E1r§;
   import flash.display.BlendMode;
   import flash.utils.getDefinitionByName;
   import starling.textures.§_-a1g§;
   import utils.§_-Xc§;
   
   public class §_-YF§ extends §_-h2I§ implements §_-Xc§
   {
      
      private static const §_-62z§:String = "acorn";
      
      public static const §_-hg§:String = "acornLover";
      
      public static const §_-22H§:String = "acornLoverHand";
      
      private var §_-eN§:Boolean = false;
      
      private var §_-71n§:int = -2;
      
      private var §_-e1V§:Boolean = true;
      
      private var §_-CJ§:§_-d2d§ = null;
      
      private var §_-7R§:§_-r1H§ = null;
      
      private var §_-j1j§:§_-h2I§ = new §_-h2I§();
      
      private var §_-P1G§:§_-d2d§;
      
      public var armature:§_-E1r§;
      
      public function §_-YF§(param1:Boolean = true)
      {
         super();
         this.§_-e1V§ = param1;
         this.§_-q1L§();
         this.setState(Hero.§_-1d§);
      }
      
      public function remove() : void
      {
         if(this.§_-CJ§)
         {
            this.§_-CJ§.removeFromParent(true);
         }
         this.§_-CJ§ = null;
         if(this.§_-P1G§)
         {
            this.§_-P1G§.removeFromParent(true);
         }
         this.§_-P1G§ = null;
         if(this.§_-7R§)
         {
            this.§_-7R§.remove();
         }
         this.§_-7R§ = null;
         §_-w2t§.§_-R2J§.remove(this.armature);
         this.armature.dispose();
         this.armature = null;
         if(this.§_-ws§(this.§_-j1j§))
         {
            removeChildStarling(this.§_-j1j§,false);
         }
         this.§_-j1j§ = null;
      }
      
      public function get state() : int
      {
         return this.§_-71n§;
      }
      
      public function setState(param1:int, param2:int = 0) : void
      {
         if(this.§_-71n§ == param1 && param1 == Hero.§_-1d§)
         {
            return;
         }
         this.§_-71n§ = param1;
         if(this.§_-CJ§)
         {
            this.§_-CJ§.stop();
            this.§_-CJ§.visible = false;
         }
         if(param1 == Hero.§_-1d§)
         {
            return;
         }
         switch(this.§_-71n§)
         {
            case Hero.§_-Mn§:
               this.§_-j1M§();
               this.§_-CJ§.gotoAndPlay(0);
               this.§_-CJ§.visible = true;
               this.§_-j1j§.visible = false;
               break;
            default:
               this.§_-j1j§.visible = true;
               this.armature.animation.gotoAndPlay(Hero.§_-E1k§[this.state]);
         }
      }
      
      public function get §_-Oj§() : Boolean
      {
         return this.§_-eN§;
      }
      
      public function set §_-Oj§(param1:Boolean) : void
      {
         this.§_-eN§ = param1;
         this.armature.§_-M1s§(§_-62z§).§_-r2q§ = param1 ? §_-62z§ : null;
         if(!param1)
         {
            return;
         }
         this.armature.animation.gotoAndPlay(§_-62z§,-1,-1,NaN,0,§_-62z§,§_-i2C§.§_-511§);
         this.armature.§_-V1S§();
         §_-w2t§.§_-R2J§.§_-ld§(§_-01Y§.delay);
      }
      
      public function setClothing(param1:Array) : void
      {
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            if(this.§_-e1V§ ? §_-g2W§.§_-91b§(param1[_loc3_]) : §_-g2W§.§_-W2e§(param1[_loc3_]))
            {
               _loc2_.push(param1[_loc3_]);
            }
            _loc3_++;
         }
         if(_loc2_.length == 0)
         {
            return;
         }
         this.§_-7R§.§_-K26§(_loc2_);
         this.§_-c2Q§();
      }
      
      public function get §_-jK§() : Array
      {
         if(this.§_-7R§ == null)
         {
            return [];
         }
         return this.§_-7R§.§_-y2A§();
      }
      
      private function §_-q1L§() : void
      {
         this.armature = §_-M10§.§_-238§().§_-g1F§(this.§_-e1V§ ? §_-M10§.§_-q1G§ : §_-M10§.§_-qT§);
         §_-w2t§.§_-R2J§.add(this.armature);
         this.§_-7R§ = new §_-r1H§(this.armature);
         this.§_-j1j§.§_-83v§(this.armature.display);
         §_-83v§(this.§_-j1j§);
         this.§_-c2Q§();
         this.§_-b2f§();
      }
      
      private function §_-j1M§() : void
      {
         if(this.§_-CJ§)
         {
            return;
         }
         var _loc1_:Class = getDefinitionByName("HeroDead") as Class;
         this.§_-CJ§ = new §_-d2d§(new _loc1_());
         this.§_-CJ§.x = 60;
         this.§_-CJ§.y = -150;
         this.§_-CJ§.blendMode = BlendMode.SCREEN;
         this.§_-CJ§.loop = false;
         this.§_-CJ§.stop();
         §_-83v§(this.§_-CJ§);
      }
      
      public function showHearts(param1:Boolean) : void
      {
         this.§_-P1G§.loop = param1;
         this.§_-P1G§.visible = param1;
         if(param1)
         {
            this.§_-P1G§.play();
         }
         else
         {
            this.§_-P1G§.stop();
         }
      }
      
      private function §_-b2f§() : void
      {
         this.§_-P1G§ = new §_-d2d§(new AcornShareView());
         this.§_-P1G§.loop = true;
         this.§_-P1G§.visible = false;
         this.§_-P1G§.stop();
         §_-83v§(this.§_-P1G§.getStarlingView());
      }
      
      private function §_-c2Q§() : void
      {
         §_-92W§.§_-LI§(this.armature,§_-a1g§.§_-C2m§,["Tail","innerHead"]);
      }
   }
}

