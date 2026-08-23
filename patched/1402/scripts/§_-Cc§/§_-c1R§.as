package §_-Cc§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-j2E§.§_-W2i§;
   import §_-s2e§.§_-O1h§;
   import flash.events.Event;
   
   public class §_-c1R§ extends §_-pp§
   {
      
      private static const §_-iw§:Number = 1;
      
      private static const §_-01s§:Number = 75 / Game.§_-12A§;
      
      private static const §_-F1O§:Number = 35 / Game.§_-12A§;
      
      private static const §_-Xm§:Number = 10 / Game.§_-12A§;
      
      private static const §_-232§:Number = 80 / Game.§_-12A§;
      
      private var §_-a2s§:Hero;
      
      private var §_-t2X§:Number;
      
      private var §_-GV§:int;
      
      private var §_-M1i§:Boolean = false;
      
      private var §_-j27§:Boolean = false;
      
      private var §_-M1Y§:Boolean = false;
      
      public function §_-c1R§(param1:Number, param2:Hero, param3:int)
      {
         super(param1);
         this.§_-a2s§ = param2;
         this.§_-t2X§ = §_-01s§ + param3 * §_-F1O§;
      }
      
      override public function §_-k20§(param1:Number) : void
      {
         super.§_-k20§(param1);
         if(!this.hero || !this.§_-a2s§ || this.§_-a2s§.isDead)
         {
            return;
         }
         if(!this.§_-a2s§.behaviourController.getState(§_-r1n§))
         {
            return;
         }
         if(this.§_-j27§)
         {
            this.§_-j27§ = false;
            this.§_-C2§();
         }
         var _loc2_:Number = this.§_-a2s§.position.x - this.hero.position.x;
         var _loc3_:Number = Math.abs(_loc2_);
         var _loc4_:int = 0;
         if(!this.§_-M1i§)
         {
            if(_loc3_ < this.§_-t2X§ - §_-Xm§)
            {
               _loc4_ = this.§_-GV§;
            }
            else
            {
               this.§_-M1i§ = true;
            }
         }
         else if(_loc3_ > this.§_-t2X§ + §_-Xm§ && this.§_-V2r§(_loc2_))
         {
            _loc4_ = _loc2_ < 0 ? -1 : 1;
         }
         this.§_-J2g§(_loc4_);
         if(_loc4_ == 0)
         {
            this.hero.heroView.direction = this.§_-a2s§.heroView.direction;
         }
         this.hero.heroView.running = _loc4_ != 0 && this.hero.onFloor;
         this.hero.heroView.update();
         this.§_-M1Y§ = this.§_-Vg§(this.hero);
      }
      
      override public function set hero(param1:Hero) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:§_-W2i§ = null;
         if(param1 == null && this.hero != null)
         {
            _loc2_ = this.hero.id == Game.selfId;
            this.§_-a2s§.removeEventListener(Hero.§_-y2S§,this.§_-g3§);
            this.hero.followId = 0;
            this.hero.isStopped = false;
            this.hero.perksAvailable = true;
            this.hero.useGravity = true;
            this.hero.left = false;
            this.hero.right = false;
            this.hero.velocity = new b2Vec2();
            this.hero.changeView();
            this.§_-a2s§ = null;
            if(_loc2_)
            {
               this.hero.sendLocation();
            }
         }
         else
         {
            if(param1.id == Game.selfId)
            {
               param1.followId = this.§_-a2s§.id;
            }
            param1.isStopped = true;
            param1.perksAvailable = false;
            param1.useGravity = true;
            this.§_-a2s§.addEventListener(Hero.§_-y2S§,this.§_-g3§);
            this.§_-GV§ = this.§_-F2i§(param1);
            this.§_-M1i§ = Math.abs(this.§_-a2s§.position.x - param1.position.x) >= this.§_-t2X§ - §_-Xm§;
            this.§_-M1Y§ = this.§_-Vg§(param1);
            _loc3_ = new §_-W2i§(§_-O1h§.§_-e1k§);
            _loc3_.name = §_-O1h§.§_-e1k§;
            param1.changeView(_loc3_);
         }
         super.hero = param1;
      }
      
      private function §_-M2Q§() : int
      {
         return this.§_-a2s§.heroView.direction ? 1 : -1;
      }
      
      private function §_-F2i§(param1:Hero) : int
      {
         var _loc2_:Number = param1.position.x - this.§_-a2s§.position.x;
         if(Math.abs(_loc2_) <= §_-Xm§)
         {
            return this.§_-M2Q§();
         }
         return _loc2_ < 0 ? -1 : 1;
      }
      
      private function §_-V2r§(param1:Number) : Boolean
      {
         var _loc2_:Number = Number(this.§_-a2s§.velocity.x);
         return Math.abs(_loc2_) >= §_-iw§ && param1 * _loc2_ > 0;
      }
      
      private function §_-Vg§(param1:Hero) : Boolean
      {
         if(!param1 || !this.§_-a2s§)
         {
            return false;
         }
         var _loc2_:b2Vec2 = this.§_-a2s§.position.Copy();
         _loc2_.Subtract(param1.position);
         return _loc2_.Length() <= this.§_-t2X§ + §_-232§;
      }
      
      private function §_-J2g§(param1:int) : void
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
      
      private function §_-C2§() : void
      {
         this.§_-GV§ = this.§_-M2Q§();
         this.§_-M1i§ = true;
         var _loc1_:b2Vec2 = this.§_-a2s§.position.Copy();
         _loc1_.x += this.§_-GV§ * this.§_-t2X§;
         this.hero.position = _loc1_;
         this.hero.velocity = new b2Vec2();
         var _loc2_:Boolean = this.hero.left || this.hero.right;
         this.§_-J2g§(0);
         if(this.hero.isSelf && !_loc2_)
         {
            this.hero.sendLocation();
         }
      }
      
      private function §_-g3§(param1:Event) : void
      {
         this.§_-j27§ = this.§_-M1Y§;
      }
   }
}

