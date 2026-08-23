package §_-Q2§
{
   import Box2D.Dynamics.b2World;
   import §_-22D§.TweenMax;
   import §_-F5§.§_-Y1d§;
   import §_-TK§.§_-f1u§;
   import §_-k1z§.§_-bh§;
   import game.mainGame.Cast;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-F1c§;
   import game.mainGame.entity.§_-71b§;
   
   public class §_-J2k§ extends §_-bh§ implements §_-Y1d§, §_-F1c§, §_-71b§
   {
      
      private static const §_-a1F§:int = 5000;
      
      private var §_-D2F§:Boolean = false;
      
      private var scale:Number = 1;
      
      private var view:§_-f1u§ = null;
      
      private var §_-42p§:Cast = null;
      
      private var §_-837§:Boolean = true;
      
      private var §_-Q26§:Number = 5000;
      
      private var §_-C1L§:Boolean = false;
      
      private var §_-21H§:SquirrelGame = null;
      
      public function §_-J2k§(param1:Number = 1, param2:Boolean = false)
      {
         super(null);
         this.scale = param1;
         this.§_-D2F§ = param2;
         var _loc3_:ArrowRed = new ArrowRed();
         _loc3_.scaleX = _loc3_.scaleY = this.scale;
         this.view = new §_-f1u§(_loc3_);
         this.view.rotation = -90;
         this.view.x = -(_loc3_.height * 0.5);
         this.view.y = _loc3_.width * 0.5;
         this.view.stop();
         §_-J2J§(this.view);
      }
      
      override public function build(param1:b2World) : void
      {
         this.§_-21H§ = param1.userData as SquirrelGame;
         if(this.view.parent)
         {
            this.view.parent.removeChild(this.view);
         }
         this.view.removeFromParent();
         var _loc2_:ArrowRed = new ArrowRed();
         _loc2_.scaleX = _loc2_.scaleY = this.scale;
         this.view = new §_-f1u§(_loc2_);
         this.view.rotation = -90;
         this.view.loop = true;
         this.view.x = -(_loc2_.height * 0.5);
         this.view.y = _loc2_.width * 0.5;
         §_-J2J§(this.view);
         if(this.§_-D2F§)
         {
            this.view.play();
         }
         else
         {
            this.view.stop();
         }
      }
      
      override public function dispose() : void
      {
         this.§_-42p§ = null;
         if(this.view)
         {
            this.view.removeFromParent();
            this.view = null;
         }
         super.dispose();
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.scale,this.§_-D2F§,this.aging,this.lifeTime]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         var _loc2_:Array = param1.pop();
         this.scale = _loc2_[0];
         this.§_-D2F§ = Boolean(_loc2_[1]);
         this.aging = Boolean(_loc2_[2]);
         this.lifeTime = _loc2_[3];
         super.§_-o2I§(param1);
      }
      
      public function get aging() : Boolean
      {
         return this.§_-837§;
      }
      
      public function set aging(param1:Boolean) : void
      {
         this.§_-837§ = param1;
      }
      
      public function get lifeTime() : Number
      {
         return this.§_-Q26§;
      }
      
      public function set lifeTime(param1:Number) : void
      {
         this.§_-Q26§ = param1;
      }
      
      public function update(param1:Number = 0) : void
      {
         if(!this.aging || this.§_-C1L§)
         {
            return;
         }
         this.§_-Q26§ -= param1 * 1000;
         if(this.lifeTime <= 0)
         {
            this.§_-th§();
         }
      }
      
      public function set cast(param1:Cast) : void
      {
         this.§_-42p§ = param1;
      }
      
      public function §_-52N§() : void
      {
         this.§_-42p§.§_-B3f§ = 0;
         this.§_-42p§.§_-g1h§ = 0;
      }
      
      public function §_-23C§() : void
      {
         if(!this.§_-42p§)
         {
            return;
         }
         this.§_-42p§.§_-B3f§ = NaN;
         this.§_-42p§.§_-g1h§ = NaN;
      }
      
      private function §_-th§() : void
      {
         if(this.§_-C1L§)
         {
            return;
         }
         this.§_-C1L§ = true;
         TweenMax.to(this,0.1,{
            "alpha":0,
            "onComplete":this.death
         });
      }
      
      private function death() : void
      {
         if(Boolean(this.§_-21H§) && Boolean(this.§_-21H§.map))
         {
            this.§_-21H§.map.§_-Y1E§(this,true);
         }
      }
   }
}

