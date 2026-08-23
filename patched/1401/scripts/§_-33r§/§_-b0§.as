package §_-33r§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-68§.§_-M10§;
   import §_-P2b§.§_-73X§;
   import flash.events.Event;
   
   public class §_-b0§ extends §_-AP§
   {
      
      private static const §_-1F§:Number = 1;
      
      private static const §_-Z2K§:Number = 75 / Game.§_-x2P§;
      
      private static const §_-mY§:Number = 35 / Game.§_-x2P§;
      
      private static const §_-wJ§:Number = 10 / Game.§_-x2P§;
      
      private static const §_-Z17§:Number = 80 / Game.§_-x2P§;
      
      private var §_-p29§:Hero;
      
      private var §_-9k§:Number;
      
      private var §_-g2Y§:int;
      
      private var §_-U1A§:Boolean = false;
      
      private var §_-16§:Boolean = false;
      
      private var §_-v19§:Boolean = false;
      
      public function §_-b0§(param1:Number, param2:Hero, param3:int)
      {
         super(param1);
         this.§_-p29§ = param2;
         this.§_-9k§ = §_-Z2K§ + param3 * §_-mY§;
      }
      
      override public function §_-g1A§(param1:Number) : void
      {
         super.§_-g1A§(param1);
         if(!this.hero || !this.§_-p29§ || this.§_-p29§.isDead)
         {
            return;
         }
         if(!this.§_-p29§.behaviourController.getState(§_-C1Y§))
         {
            return;
         }
         if(this.§_-16§)
         {
            this.§_-16§ = false;
            this.§_-ab§();
         }
         var _loc2_:Number = this.§_-p29§.position.x - this.hero.position.x;
         var _loc3_:Number = Math.abs(_loc2_);
         var _loc4_:int = 0;
         if(!this.§_-U1A§)
         {
            if(_loc3_ < this.§_-9k§ - §_-wJ§)
            {
               _loc4_ = this.§_-g2Y§;
            }
            else
            {
               this.§_-U1A§ = true;
            }
         }
         else if(_loc3_ > this.§_-9k§ + §_-wJ§ && this.§_-q2Z§(_loc2_))
         {
            _loc4_ = _loc2_ < 0 ? -1 : 1;
         }
         this.§_-rW§(_loc4_);
         if(_loc4_ == 0)
         {
            this.hero.heroView.direction = this.§_-p29§.heroView.direction;
         }
         this.hero.heroView.running = _loc4_ != 0 && this.hero.onFloor;
         this.hero.heroView.update();
         this.§_-v19§ = this.§_-h1s§(this.hero);
      }
      
      override public function set hero(param1:Hero) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:§_-73X§ = null;
         if(param1 == null && this.hero != null)
         {
            _loc2_ = this.hero.id == Game.selfId;
            this.§_-p29§.removeEventListener(Hero.§_-Y1J§,this.§_-mZ§);
            this.hero.followId = 0;
            this.hero.isStopped = false;
            this.hero.perksAvailable = true;
            this.hero.useGravity = true;
            this.hero.left = false;
            this.hero.right = false;
            this.hero.velocity = new b2Vec2();
            this.hero.changeView();
            this.§_-p29§ = null;
            if(_loc2_)
            {
               this.hero.sendLocation();
            }
         }
         else
         {
            if(param1.id == Game.selfId)
            {
               param1.followId = this.§_-p29§.id;
            }
            param1.isStopped = true;
            param1.perksAvailable = false;
            param1.useGravity = true;
            this.§_-p29§.addEventListener(Hero.§_-Y1J§,this.§_-mZ§);
            this.§_-g2Y§ = this.§_-K2F§(param1);
            this.§_-U1A§ = Math.abs(this.§_-p29§.position.x - param1.position.x) >= this.§_-9k§ - §_-wJ§;
            this.§_-v19§ = this.§_-h1s§(param1);
            _loc3_ = new §_-73X§(§_-M10§.§_-31y§);
            _loc3_.name = §_-M10§.§_-31y§;
            param1.changeView(_loc3_);
         }
         super.hero = param1;
      }
      
      private function §_-H2U§() : int
      {
         return this.§_-p29§.heroView.direction ? 1 : -1;
      }
      
      private function §_-K2F§(param1:Hero) : int
      {
         var _loc2_:Number = param1.position.x - this.§_-p29§.position.x;
         if(Math.abs(_loc2_) <= §_-wJ§)
         {
            return this.§_-H2U§();
         }
         return _loc2_ < 0 ? -1 : 1;
      }
      
      private function §_-q2Z§(param1:Number) : Boolean
      {
         var _loc2_:Number = Number(this.§_-p29§.velocity.x);
         return Math.abs(_loc2_) >= §_-1F§ && param1 * _loc2_ > 0;
      }
      
      private function §_-h1s§(param1:Hero) : Boolean
      {
         if(!param1 || !this.§_-p29§)
         {
            return false;
         }
         var _loc2_:b2Vec2 = this.§_-p29§.position.Copy();
         _loc2_.Subtract(param1.position);
         return _loc2_.Length() <= this.§_-9k§ + §_-Z17§;
      }
      
      private function §_-rW§(param1:int) : void
      {
         var _loc2_:Boolean = this.hero.left || this.hero.right;
         var _loc3_:Boolean = param1 != 0;
         this.hero.left = param1 < 0;
         this.hero.right = param1 > 0;
         if(_loc3_)
         {
            this.hero.heroView.direction = param1 < 0;
         }
         else if(this.hero.onFloor)
         {
            this.hero.velocity = new b2Vec2(0,this.hero.velocity.y);
         }
         if(_loc2_ != _loc3_ && this.hero.isSelf)
         {
            this.hero.sendLocation();
         }
      }
      
      private function §_-ab§() : void
      {
         this.§_-g2Y§ = this.§_-H2U§();
         this.§_-U1A§ = true;
         var _loc1_:b2Vec2 = this.§_-p29§.position.Copy();
         _loc1_.x += this.§_-g2Y§ * this.§_-9k§;
         this.hero.position = _loc1_;
         this.hero.velocity = new b2Vec2();
         var _loc2_:Boolean = this.hero.left || this.hero.right;
         this.§_-rW§(0);
         if(this.hero.isSelf && !_loc2_)
         {
            this.hero.sendLocation();
         }
      }
      
      private function §_-mZ§(param1:Event) : void
      {
         this.§_-16§ = this.§_-v19§;
      }
   }
}

