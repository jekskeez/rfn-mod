package §_-P2b§
{
   import §_-68§.§_-M10§;
   import §_-N14§.§_-w2t§;
   import §_-RI§.§_-h2I§;
   import dragonBones.§_-E1r§;
   import utils.§_-Xc§;
   
   public class §_-73X§ extends §_-h2I§ implements §_-Xc§
   {
      
      private var state:int = -2;
      
      public var armature:§_-E1r§;
      
      public var §_-P2Z§:Boolean = false;
      
      public function §_-73X§(param1:String)
      {
         super();
         this.armature = §_-M10§.§_-238§().§_-g1F§(param1);
         §_-83v§(this.armature.display);
         §_-w2t§.§_-R2J§.add(this.armature);
      }
      
      override public function removeFromParent(param1:Boolean = true) : void
      {
         §_-w2t§.§_-R2J§.remove(this.armature);
         removeChildStarling(this.armature.display);
         this.armature.dispose();
         this.armature = null;
         super.removeFromParent(param1);
      }
      
      public function setState(param1:int, param2:int = 0) : void
      {
         if(this.§_-P2Z§ || this.state == param1 && param1 == Hero.§_-1d§)
         {
            return;
         }
         this.state = param1;
         if(!this.armature)
         {
            return;
         }
         switch(this.state)
         {
            case Hero.§_-1d§:
               this.armature.animation.stop();
               break;
            case Hero.§_-w11§:
            case Hero.§_-T1p§:
            case Hero.§_-ZP§:
               this.armature.animation.gotoAndPlay(Hero.§_-E1k§[this.state]);
         }
      }
   }
}

