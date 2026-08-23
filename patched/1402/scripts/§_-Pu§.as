package
{
   import §_-TK§.§_-aS§;
   import §_-TK§.§_-f1u§;
   import §_-Vu§.§_-p4§;
   import §_-s2e§.§_-O1h§;
   import dragonBones.§_-833§;
   import flash.display.BlendMode;
   import flash.utils.getDefinitionByName;
   import utils.§_-y4§;
   
   public class §_-Pu§ extends §_-aS§ implements §_-y4§
   {
      
      private static const §_-W1V§:String = "fire";
      
      private static const §_-k2P§:String = "Head";
      
      private static const §_-Xw§:String = "acorn";
      
      private static const §_-eD§:String = "belt";
      
      private var §_-q2N§:Boolean = false;
      
      private var §_-D2k§:int = -2;
      
      private var §_-41T§:Boolean = false;
      
      private var armature:§_-833§ = null;
      
      private var §_-t1h§:§_-aS§ = new §_-aS§();
      
      private var §_-q1Q§:§_-f1u§ = null;
      
      private var §_-n2c§:Boolean = false;
      
      private var §_-11r§:Boolean = false;
      
      public function §_-Pu§()
      {
         super();
         this.§_-g2s§();
         this.setState(Hero.§_-72g§);
         this.§_-n2c§ = false;
      }
      
      public function remove() : void
      {
         this.§_-11r§ = true;
         if(this.§_-q1Q§)
         {
            this.§_-q1Q§.removeFromParent(true);
         }
         this.§_-q1Q§ = null;
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
         if(this.§_-q1Q§)
         {
            this.§_-q1Q§.stop();
            this.§_-q1Q§.visible = false;
         }
         if(param1 == Hero.§_-72g§)
         {
            return;
         }
         if(this.§_-n2c§)
         {
            this.§_-n2c§ = false;
            return;
         }
         switch(this.§_-D2k§)
         {
            case Hero.§_-mM§:
               this.§_-n2c§ = true;
               this.§_-xF§();
               this.§_-q1Q§.gotoAndPlay(0);
               this.§_-q1Q§.visible = true;
               this.§_-t1h§.visible = false;
               break;
            default:
               this.§_-t1h§.visible = true;
               this.armature.animation.gotoAndPlay(Hero.§_-p2Z§[this.state],-1,-1,0);
         }
      }
      
      public function set §_-2I§(param1:Boolean) : void
      {
         this.§_-q2N§ = param1;
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
      
      public function get fire() : Boolean
      {
         return this.§_-41T§;
      }
      
      public function set fire(param1:Boolean) : void
      {
         this.§_-41T§ = param1;
         if(param1)
         {
            this.armature.§_-i2v§(§_-k2P§).childArmature.animation.gotoAndPlay(§_-W1V§);
         }
         else
         {
            this.armature.§_-i2v§(§_-k2P§).childArmature.animation.gotoAndPlay(Hero.§_-z1s§);
         }
      }
      
      private function §_-g2s§() : void
      {
         this.armature = §_-O1h§.§_-y1y§().§_-i2H§(§_-O1h§.§_-Z1h§);
         §_-p4§.§_-m1U§.add(this.armature);
         this.§_-t1h§.§_-J2J§(this.armature.display);
         §_-J2J§(this.§_-t1h§);
      }
      
      private function §_-xF§() : void
      {
         if(this.§_-q1Q§)
         {
            return;
         }
         var _loc1_:Class = getDefinitionByName("DragonDead") as Class;
         this.§_-q1Q§ = new §_-f1u§(new _loc1_());
         this.§_-q1Q§.blendMode = BlendMode.SCREEN;
         this.§_-q1Q§.loop = false;
         this.§_-q1Q§.stop();
         §_-J2J§(this.§_-q1Q§);
      }
   }
}

