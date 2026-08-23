package §_-j2E§
{
   import §_-TK§.§_-aS§;
   import §_-Vu§.§_-p4§;
   import §_-s2e§.§_-O1h§;
   import dragonBones.§_-833§;
   import utils.§_-y4§;
   
   public class §_-W2i§ extends §_-aS§ implements §_-y4§
   {
      
      private var state:int = -2;
      
      public var armature:§_-833§;
      
      public var §_-A2m§:Boolean = false;
      
      public function §_-W2i§(param1:String)
      {
         super();
         this.armature = §_-O1h§.§_-y1y§().§_-i2H§(param1);
         §_-J2J§(this.armature.display);
         §_-p4§.§_-m1U§.add(this.armature);
      }
      
      override public function removeFromParent(param1:Boolean = true) : void
      {
         §_-p4§.§_-m1U§.remove(this.armature);
         removeChildStarling(this.armature.display);
         this.armature.dispose();
         this.armature = null;
         super.removeFromParent(param1);
      }
      
      public function setState(param1:int, param2:int = 0) : void
      {
         if(this.§_-A2m§ || this.state == param1 && param1 == Hero.§_-72g§)
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
            case Hero.§_-72g§:
               this.armature.animation.stop();
               break;
            case Hero.§_-b1i§:
            case Hero.§_-h1o§:
            case Hero.§_-l19§:
               this.armature.animation.gotoAndPlay(Hero.§_-p2Z§[this.state]);
         }
      }
   }
}

