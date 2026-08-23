package
{
   import §_-68§.§_-M10§;
   import §_-N14§.§_-w2t§;
   import §_-RI§.§_-d2d§;
   import §_-RI§.§_-h2I§;
   import dragonBones.§_-E1r§;
   import flash.display.BlendMode;
   import flash.utils.getDefinitionByName;
   import utils.§_-Xc§;
   
   public class §_-21X§ extends §_-h2I§ implements §_-Xc§
   {
      
      private static const §_-o1D§:String = "fire";
      
      private static const §_-42Z§:String = "Head";
      
      private static const §_-62z§:String = "acorn";
      
      private static const §_-229§:String = "belt";
      
      private var §_-eN§:Boolean = false;
      
      private var §_-71n§:int = -2;
      
      private var §_-r1J§:Boolean = false;
      
      private var armature:§_-E1r§ = null;
      
      private var §_-j1j§:§_-h2I§ = new §_-h2I§();
      
      private var §_-03S§:§_-d2d§ = null;
      
      private var §_-f1S§:Boolean = false;
      
      private var §_-Zs§:Boolean = false;
      
      public function §_-21X§()
      {
         super();
         this.§_-q1L§();
         this.setState(Hero.§_-1d§);
         this.§_-f1S§ = false;
      }
      
      public function remove() : void
      {
         this.§_-Zs§ = true;
         if(this.§_-03S§)
         {
            this.§_-03S§.removeFromParent(true);
         }
         this.§_-03S§ = null;
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
         if(this.§_-03S§)
         {
            this.§_-03S§.stop();
            this.§_-03S§.visible = false;
         }
         if(param1 == Hero.§_-1d§)
         {
            return;
         }
         if(this.§_-f1S§)
         {
            this.§_-f1S§ = false;
            return;
         }
         switch(this.§_-71n§)
         {
            case Hero.§_-Mn§:
               this.§_-f1S§ = true;
               this.§_-E4§();
               this.§_-03S§.gotoAndPlay(0);
               this.§_-03S§.visible = true;
               this.§_-j1j§.visible = false;
               break;
            default:
               this.§_-j1j§.visible = true;
               this.armature.animation.gotoAndPlay(Hero.§_-E1k§[this.state],-1,-1,0);
         }
      }
      
      public function set §_-Oj§(param1:Boolean) : void
      {
         this.§_-eN§ = param1;
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
      
      public function get fire() : Boolean
      {
         return this.§_-r1J§;
      }
      
      public function set fire(param1:Boolean) : void
      {
         this.§_-r1J§ = param1;
         if(param1)
         {
            this.armature.§_-M1s§(§_-42Z§).childArmature.animation.gotoAndPlay(§_-o1D§);
         }
         else
         {
            this.armature.§_-M1s§(§_-42Z§).childArmature.animation.gotoAndPlay(Hero.§_-01j§);
         }
      }
      
      private function §_-q1L§() : void
      {
         this.armature = §_-M10§.§_-238§().§_-g1F§(§_-M10§.§_-c2v§);
         §_-w2t§.§_-R2J§.add(this.armature);
         this.§_-j1j§.§_-83v§(this.armature.display);
         §_-83v§(this.§_-j1j§);
      }
      
      private function §_-E4§() : void
      {
         if(this.§_-03S§)
         {
            return;
         }
         var _loc1_:Class = getDefinitionByName("DragonDead") as Class;
         this.§_-03S§ = new §_-d2d§(new _loc1_());
         this.§_-03S§.blendMode = BlendMode.SCREEN;
         this.§_-03S§.loop = false;
         this.§_-03S§.stop();
         §_-83v§(this.§_-03S§);
      }
   }
}

