package tape
{
   import §_-61C§.§_-a2p§;
   import §_-8Q§.Balk;
   import §_-8Q§.BalloonBody;
   import §_-8Q§.Box;
   import §_-8Q§.PoiseRight;
   import §_-8Q§.PortalBlue;
   import §_-8Q§.PortalRed;
   import §_-8Q§.Trampoline;
   import §_-8Q§.WeightBody;
   import §_-8Q§.§_-21l§;
   import §_-8Q§.§_-2G§;
   import §_-8Q§.§_-31p§;
   import §_-8Q§.§_-622§;
   import §_-8Q§.§_-92B§;
   import §_-8Q§.§_-A2Q§;
   import §_-8Q§.§_-B2i§;
   import §_-8Q§.§_-HR§;
   import §_-8Q§.§_-K2j§;
   import §_-8Q§.§_-MV§;
   import §_-8Q§.§_-N23§;
   import §_-8Q§.§_-N2e§;
   import §_-8Q§.§_-Pl§;
   import §_-8Q§.§_-W26§;
   import §_-8Q§.§_-dO§;
   import §_-8Q§.§_-e1P§;
   import §_-8Q§.§_-ep§;
   import §_-8Q§.§_-gG§;
   import §_-8Q§.§_-m1m§;
   import §_-8Q§.§_-n1v§;
   import §_-8Q§.§_-nI§;
   import §_-8Q§.§_-o25§;
   import §_-8Q§.§_-q2D§;
   import §_-8Q§.§_-rG§;
   import §_-8Q§.§_-xA§;
   import §_-8Q§.§_-y1I§;
   import §_-8Q§.§_-y2g§;
   import §_-8Q§.§_-ys§;
   import §_-8Q§.§_-z2J§;
   import §_-F5§.BodyDestructor;
   import §_-F5§.Hammer;
   import §_-F5§.§_-63c§;
   import §_-I1q§.§_-C3Q§;
   import §_-I1q§.§_-Fr§;
   import §_-I1q§.§_-K8§;
   import §_-I1q§.§_-d2U§;
   import §_-I1q§.§_-r2T§;
   import §_-I1q§.§_-w27§;
   import §_-M16§.§_-Z2Z§;
   import §_-X2V§.CastItemEvent;
   import §_-X2V§.SquirrelEvent;
   import §_-c2C§.§_-H1k§;
   import §_-c2C§.§_-S2E§;
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-u24§;
   import §_-cm§.§_-V1t§;
   import §_-g16§.§_-713§;
   import §_-g16§.§_-CM§;
   import §_-g16§.§_-L1n§;
   import §_-g16§.§_-j1C§;
   import §_-g16§.§_-w3§;
   import §_-g2C§.§_-A2Y§;
   import §_-j1y§.§_-Y3§;
   import §_-j2H§.Stone;
   import §_-l2u§.§_-62b§;
   import buttons.§_-613§;
   import events.CastItemsEvent;
   import events.§_-Am§;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.ui.Keyboard;
   import game.mainGame.§_-v1N§;
   import utils.§_-Zc§;
   
   public class §_-KG§ extends §_-71i§
   {
      
      private static const §_-5K§:int = 7;
      
      private static const §_-c1g§:int = 3;
      
      protected static var §_-M1W§:Array = null;
      
      protected var §_-Nv§:Object = {};
      
      private var §_-k1D§:Hero = null;
      
      private var §_-D2Z§:Boolean = false;
      
      private var items:§_-h2f§ = new §_-h2f§();
      
      private var §_-11Y§:§_-h2f§ = new §_-h2f§();
      
      private var §_-j16§:§_-K21§ = new §_-K21§();
      
      private var selected:§_-N1N§ = null;
      
      public function §_-KG§(param1:int = 4, param2:int = 1, param3:int = 0, param4:int = 0, param5:Boolean = true)
      {
         super(param1,param2,param3,param4,param5);
         setData(this.§_-11Y§);
         this.§_-j2y§();
         this.update();
         if(§_-KG§.§_-M1W§ == null)
         {
            §_-KG§.§_-M1W§ = [§_-r2T§,§_-C3Q§,§_-d2U§,§_-Z2Z§,§_-w27§,§_-K8§,§_-A2Q§,§_-Fr§,§_-e1P§,BodyDestructor,Hammer,§_-63c§,§_-o25§,PoiseRight,§_-92B§,§_-ys§,§_-2G§,§_-31p§,§_-n1v§,BalloonBody,§_-m1m§,Trampoline,Balk,§_-y1I§,§_-rG§,§_-622§,§_-ep§,§_-dO§,PortalRed,PortalBlue,§_-q2D§,§_-z2J§,§_-nI§,§_-B2i§,§_-K2j§,§_-xA§,§_-gG§,§_-y2g§,§_-Pl§,§_-N23§,Box,§_-MV§,§_-W26§,§_-21l§,§_-HR§,§_-N2e§,WeightBody,Stone,§_-w3§,§_-713§,§_-CM§,§_-L1n§,§_-j1C§];
         }
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-r1i§);
      }
      
      public function get hero() : Hero
      {
         return this.§_-k1D§;
      }
      
      public function set hero(param1:Hero) : void
      {
         if(this.§_-k1D§ != null)
         {
            this.hero.§_-h1z§.removeEventListener(CastItemsEvent.UPDATE,this.§_-K26§);
            this.hero.§_-h1z§.removeEventListener(CastItemEvent.ITEM_ADD,this.addItem);
            this.hero.removeEventListener(SquirrelEvent.§_-E25§,this.§_-f1q§);
            this.hero.removeEventListener(SquirrelEvent.§_-pZ§,this.§_-3W§);
            this.hero.removeEventListener(SquirrelEvent.§_-Z2N§,this.§_-h1n§);
            this.hero.removeEventListener(SquirrelEvent.§_-F2W§,this.§_-U2V§);
         }
         this.§_-k1D§ = param1;
         if(this.hero == null)
         {
            this.§_-K26§();
            return;
         }
         this.hero.§_-h1z§.addEventListener(CastItemsEvent.UPDATE,this.§_-K26§);
         this.hero.§_-h1z§.addEventListener(CastItemEvent.ITEM_ADD,this.addItem);
         this.hero.addEventListener(SquirrelEvent.§_-E25§,this.§_-f1q§,false,1);
         this.hero.addEventListener(SquirrelEvent.§_-pZ§,this.§_-3W§);
         this.hero.addEventListener(SquirrelEvent.§_-Z2N§,this.§_-h1n§);
         this.hero.addEventListener(SquirrelEvent.§_-F2W§,this.§_-U2V§);
         this.§_-K26§();
      }
      
      public function reset() : void
      {
         this.data.clear();
      }
      
      public function §_-xq§(param1:Class) : void
      {
         this.§_-l16§();
         var _loc2_:int = 0;
         while(_loc2_ < this.items.objects.length)
         {
            if((this.items.objects[_loc2_] as §_-N1N§).§_-i1H§.§_-IA§ == param1)
            {
               if(!(this.§_-b1f§ && !((this.items.objects[_loc2_] as §_-N1N§).§_-i1H§.type == §_-v1N§.§_-T1s§ || (this.items.objects[_loc2_] as §_-N1N§).§_-i1H§.type == §_-v1N§.§_-W29§)))
               {
                  if(!(!this.§_-b1f§ && !((this.items.objects[_loc2_] as §_-N1N§).§_-i1H§.type == §_-v1N§.§_-T2l§ || (this.items.objects[_loc2_] as §_-N1N§).§_-i1H§.type == §_-v1N§.§_-W29§)))
                  {
                     this.selected = this.items.objects[_loc2_] as §_-N1N§;
                     this.selected.§_-22p§();
                  }
               }
            }
            _loc2_++;
         }
      }
      
      public function §_-l16§() : void
      {
         if(this.selected != null)
         {
            this.selected.§_-4Y§();
         }
         this.selected = null;
      }
      
      public function §_-r15§() : void
      {
         this.§_-5z§();
      }
      
      override protected function update() : void
      {
         var _loc2_:§_-N1N§ = null;
         var _loc1_:Boolean = this.§_-93R§;
         if(!_loc1_ && this.§_-A1Z§ != this.§_-d16§)
         {
            this.§_-A1Z§ = this.§_-d16§;
            this.§_-j2y§();
         }
         super.update();
         for each(_loc2_ in this.items.objects)
         {
            if(_loc2_.§_-i1H§.type == §_-v1N§.§_-W29§)
            {
               _loc2_.icon.alpha = _loc2_.§_-i1H§.count > 0 ? 1 : 0.1;
            }
         }
         this.§_-j16§.visible = _loc1_;
         dispatchEvent(new CastItemEvent(CastItemEvent.TAPE_UPDATE,null));
         this.§_-5z§();
      }
      
      override protected function §_-j2y§() : void
      {
         var _loc1_:ButtonRewindLeft = null;
         var _loc2_:ButtonRewindLeftInactive = null;
         var _loc3_:ButtonRewindRight = null;
         var _loc4_:ButtonRewindRightInactive = null;
         if(this.§_-T1X§ == null)
         {
            _loc1_ = new ButtonRewindLeft();
            _loc1_.upState.cacheAsBitmap = true;
            _loc2_ = new ButtonRewindLeftInactive();
            _loc2_.upState.cacheAsBitmap = true;
            this.§_-T1X§ = new §_-613§(_loc1_,_loc2_);
         }
         if(this.buttonNext == null)
         {
            _loc3_ = new ButtonRewindRight();
            _loc3_.upState.cacheAsBitmap = true;
            _loc4_ = new ButtonRewindRightInactive();
            _loc4_.upState.cacheAsBitmap = true;
            this.buttonNext = new §_-613§(_loc3_,_loc4_);
         }
         this.§_-T1X§.x = 2;
         this.§_-T1X§.y = int(((this.offsetY + this.§_-g6§) * this.§_-w1q§ - this.buttonNext.height) * 0.5);
         this.buttonNext.x = (this.offsetX + this.§_-13r§) * this.§_-A1Z§ - this.offsetX - 12;
         this.buttonNext.y = int(((this.offsetY + this.§_-g6§) * this.§_-w1q§ - this.buttonNext.height) * 0.5);
         addChild(this.§_-T1X§);
         addChild(this.buttonNext);
         this.§_-T1X§.addEventListener(MouseEvent.CLICK,this.§_-SO§);
         this.buttonNext.addEventListener(MouseEvent.CLICK,this.§_-M12§);
         this.§_-j16§.x = (this.items.objects.length < §_-p2w§() ? Math.min(§_-p2w§(),this.items.objects.length - this.offset) : §_-p2w§()) * (this.offsetX + this.§_-13r§) + 63;
         addChild(this.§_-j16§);
      }
      
      protected function §_-33M§(param1:MouseEvent = null) : void
      {
         param1.stopImmediatePropagation();
         var _loc2_:§_-N1N§ = param1.currentTarget as §_-N1N§;
         dispatchEvent(new §_-Am§(_loc2_.§_-i1H§.§_-IA§));
      }
      
      private function §_-K26§(param1:CastItemsEvent = null) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.items.objects.length)
         {
            this.items.objects[_loc2_].removeEventListener(CastItemEvent.§_-N1W§,this.§_-yk§);
            this.items.objects[_loc2_].removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-33M§);
            (this.items.objects[_loc2_] as §_-N1N§).dispose();
            _loc2_++;
         }
         this.§_-D2Z§ = false;
         this.items = new §_-h2f§();
         if(this.hero == null)
         {
            this.§_-h1n§();
            return;
         }
         this.addItems(this.hero.§_-h1z§.items);
         if(Boolean(!this.§_-D2Z§ && this.§_-b1f§) && Boolean(this.hero.game) && Boolean(this.hero.game.map))
         {
            this.§_-023§();
         }
      }
      
      private function addItem(param1:CastItemEvent) : void
      {
         var _loc3_:§_-N1N§ = null;
         if(§_-KG§.§_-M1W§.indexOf(param1.§_-i1H§.§_-IA§) == -1)
         {
            return;
         }
         var _loc2_:Boolean = this.§_-b1f§ ? param1.§_-i1H§.type != §_-v1N§.§_-T2l§ : param1.§_-i1H§.type != §_-v1N§.§_-T1s§;
         if(param1.§_-i1H§.type == §_-v1N§.§_-T1s§)
         {
            _loc3_ = new §_-N1N§(param1.§_-i1H§);
         }
         else
         {
            _loc3_ = new §_-t2b§(param1.§_-i1H§);
            _loc3_.§_-i1H§.addEventListener(CastItemEvent.§_-N1W§,this.§_-yk§);
         }
         _loc3_.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-33M§);
         this.items.addObject(_loc3_);
         if(!_loc2_)
         {
            return;
         }
         if(!this.§_-b1f§ && this.§_-sJ§ && param1.§_-i1H§.type == §_-v1N§.§_-T2l§)
         {
            return;
         }
         this.§_-11Y§.addObject(_loc3_);
         this.§_-11Y§.objects.sort(this.§_-J24§);
         this.update();
         this.§_-5z§();
         this.§_-j16§.§_-31w§ = this.§_-11Y§.objects;
         this.§_-L0§();
      }
      
      private function addItems(param1:Vector.<§_-v1N§>) : void
      {
         var _loc3_:§_-N1N§ = null;
         if(this.items == null)
         {
            this.items = new §_-h2f§();
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            if(§_-KG§.§_-M1W§.indexOf(param1[_loc2_].§_-IA§) != -1)
            {
               if(param1[_loc2_].type == §_-v1N§.§_-T1s§)
               {
                  _loc3_ = new §_-N1N§(param1[_loc2_]);
               }
               else
               {
                  _loc3_ = new §_-t2b§(param1[_loc2_]);
                  _loc3_.§_-i1H§.addEventListener(CastItemEvent.§_-N1W§,this.§_-yk§);
               }
               _loc3_.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-33M§);
               this.items.addObject(_loc3_);
            }
            _loc2_++;
         }
         this.§_-h1n§();
      }
      
      private function §_-h1n§(param1:SquirrelEvent = null) : void
      {
         if(this.hero != null && (this.§_-b1f§ || this.hero is §_-V1t§))
         {
            this.§_-A1Z§ = §_-5K§;
         }
         else
         {
            this.§_-A1Z§ = §_-c1g§;
         }
         this.§_-j2y§();
         if(this.hero == null)
         {
            this.§_-11Y§.clear();
            return;
         }
         if(!this.§_-D2Z§ && this.§_-b1f§)
         {
            this.§_-023§();
            return;
         }
         this.§_-11Y§.objects = this.items.objects.filter(this.§_-x1u§);
         this.§_-11Y§.objects.sort(this.§_-J24§);
         this.§_-U2V§();
         this.update();
         this.§_-j16§.§_-31w§ = this.§_-11Y§.objects;
         this.§_-L0§();
         this.§_-5z§();
      }
      
      private function §_-023§() : void
      {
         this.§_-D2Z§ = true;
         if(!this.hero || !this.hero.game)
         {
            return;
         }
         if(!this.hero.game.map || !this.hero.game.map.§_-d14§)
         {
            return;
         }
         var _loc1_:Vector.<§_-v1N§> = §_-Zc§.§_-B4§(this.hero.game.map.§_-d14§);
         this.addItems(_loc1_);
      }
      
      private function §_-x1u§(param1:§_-N1N§, param2:int, param3:Vector.<§_-QN§>) : Boolean
      {
         if(Boolean(param2) || Boolean(param3))
         {
         }
         if(this.§_-b1f§ && (param1.§_-i1H§.type == §_-v1N§.§_-T1s§ || param1.§_-i1H§.type == §_-v1N§.§_-W29§))
         {
            return true;
         }
         if(!this.§_-b1f§ && this.§_-sJ§ && param1.§_-i1H§.type == §_-v1N§.§_-T2l§)
         {
            return false;
         }
         return !this.§_-b1f§ && (param1.§_-i1H§.type == §_-v1N§.§_-T2l§ || param1.§_-i1H§.type == §_-v1N§.§_-W29§);
      }
      
      private function §_-O1j§(param1:§_-N1N§, param2:int, param3:Vector.<§_-QN§>) : Boolean
      {
         if(Boolean(param2) || Boolean(param3))
         {
         }
         if(param1.§_-i1H§.type == §_-v1N§.§_-T2l§)
         {
            return true;
         }
         param1.dispose();
         param1.removeEventListener(CastItemEvent.§_-N1W§,this.§_-yk§);
         return false;
      }
      
      private function §_-4B§(param1:§_-N1N§, param2:int, param3:Vector.<§_-QN§>) : Boolean
      {
         if(Boolean(param2) || Boolean(param3))
         {
         }
         if(param1.§_-i1H§.type == §_-v1N§.§_-T2l§ || param1.§_-i1H§.type == §_-v1N§.§_-T1s§)
         {
            return true;
         }
         param1.dispose();
         param1.removeEventListener(CastItemEvent.§_-N1W§,this.§_-yk§);
         return false;
      }
      
      private function §_-R6§(param1:§_-N1N§, param2:int, param3:Vector.<§_-QN§>) : Boolean
      {
         var _loc4_:§_-v1N§ = null;
         if(Boolean(param2) || Boolean(param3))
         {
         }
         if(param1.§_-i1H§.type == §_-v1N§.§_-T1s§)
         {
            return true;
         }
         if(param1.§_-i1H§.type == §_-v1N§.§_-W29§)
         {
            return true;
         }
         if(Boolean(this.hero) && Boolean(this.hero.§_-h1z§))
         {
            _loc4_ = this.hero.§_-h1z§.§_-815§(param1.§_-i1H§.§_-IA§,param1.§_-i1H§.type);
            if(!_loc4_)
            {
               param1.dispose();
               param1.removeEventListener(CastItemEvent.§_-N1W§,this.§_-yk§);
               return false;
            }
         }
         if(param1.§_-i1H§.count > 0)
         {
            return true;
         }
         param1.dispose();
         param1.removeEventListener(CastItemEvent.§_-N1W§,this.§_-yk§);
         return false;
      }
      
      private function §_-H1t§(param1:§_-N1N§, param2:int, param3:Vector.<§_-QN§>) : Boolean
      {
         if(Boolean(param2) || Boolean(param3))
         {
         }
         if(Boolean(this.hero) && Boolean(this.hero.team == Hero.§_-i1Y§) && (param1.§_-i1H§.§_-IA§ == §_-K2j§ || param1.§_-i1H§.§_-IA§ == §_-xA§ || param1.§_-i1H§.§_-IA§ == §_-Pl§ || param1.§_-i1H§.§_-IA§ == §_-N23§))
         {
            return false;
         }
         if(Boolean(this.hero) && Boolean(this.hero.team == Hero.§_-l1B§) && (param1.§_-i1H§.§_-IA§ == §_-nI§ || param1.§_-i1H§.§_-IA§ == §_-B2i§ || param1.§_-i1H§.§_-IA§ == §_-gG§ || param1.§_-i1H§.§_-IA§ == §_-y2g§))
         {
            return false;
         }
         return true;
      }
      
      private function §_-J24§(param1:§_-N1N§, param2:§_-N1N§) : int
      {
         if(§_-KG§.§_-M1W§.indexOf(param1.§_-i1H§.§_-IA§) < §_-KG§.§_-M1W§.indexOf(param2.§_-i1H§.§_-IA§))
         {
            return -1;
         }
         if(§_-KG§.§_-M1W§.indexOf(param1.§_-i1H§.§_-IA§) > §_-KG§.§_-M1W§.indexOf(param2.§_-i1H§.§_-IA§))
         {
            return 1;
         }
         if(param1.§_-i1H§.type > param2.§_-i1H§.type)
         {
            return 1;
         }
         return -1;
      }
      
      private function §_-3W§(param1:SquirrelEvent) : void
      {
         this.items.objects = this.items.objects.filter(this.§_-O1j§);
         this.§_-D2Z§ = false;
         this.§_-h1n§();
      }
      
      private function §_-f1q§(param1:SquirrelEvent) : void
      {
         this.items.objects = this.items.objects.filter(this.§_-4B§);
         this.§_-h1n§();
      }
      
      private function §_-yk§(param1:CastItemEvent) : void
      {
         this.items.objects = this.items.objects.filter(this.§_-R6§);
         this.§_-11Y§.objects = this.§_-11Y§.objects.filter(this.§_-R6§);
         this.§_-11Y§.objects.sort(this.§_-J24§);
         this.§_-j2y§();
         this.update();
         this.§_-5z§();
         this.§_-j16§.§_-31w§ = this.§_-11Y§.objects;
         this.§_-L0§();
      }
      
      private function §_-5z§() : void
      {
         this.§_-Nv§ = {};
         this.§_-C1J§();
         if(!this.data || this.data.objects.length == 0 || §_-a2p§.§_-P2e§)
         {
            return;
         }
         var _loc1_:int = 0;
         while(_loc1_ < this.data.objects.length && _loc1_ < 10)
         {
            this.§_-Nv§[_loc1_] = (this.data.objects[_loc1_] as §_-N1N§).§_-i1H§.§_-IA§;
            if(_loc1_ == 9)
            {
               (this.data.objects[_loc1_] as §_-N1N§).§_-G2m§(0);
            }
            else
            {
               (this.data.objects[_loc1_] as §_-N1N§).§_-G2m§(_loc1_ + 1);
            }
            _loc1_++;
         }
      }
      
      private function §_-C1J§() : void
      {
         if(!this.data)
         {
            return;
         }
         var _loc1_:int = 0;
         while(_loc1_ < this.data.objects.length)
         {
            (this.data.objects[_loc1_] as §_-N1N§).§_-h2l§();
            _loc1_++;
         }
      }
      
      private function §_-r1i§(param1:KeyboardEvent) : void
      {
         if(param1.shiftKey || param1.ctrlKey)
         {
            return;
         }
         if(Game.chat.visible || §_-A2Y§.visible || §_-Y3§.visible || §_-a2p§.§_-P2e§)
         {
            return;
         }
         if(param1.keyCode == Keyboard.TAB && §_-a2p§.perksAvailable && !(§_-t2c§.active is §_-H1k§))
         {
            this.§_-5z§();
            return;
         }
         var _loc2_:int = param1.keyCode - 49;
         if(_loc2_ in this.§_-Nv§ && this.visible)
         {
            dispatchEvent(new §_-Am§(this.§_-Nv§[_loc2_]));
            param1.stopImmediatePropagation();
            return;
         }
         if(_loc2_ == -1 && "9" in this.§_-Nv§)
         {
            dispatchEvent(new §_-Am§(this.§_-Nv§["9"]));
            param1.stopImmediatePropagation();
         }
      }
      
      private function §_-M12§(param1:MouseEvent) : void
      {
         if(this.offset + §_-p2w§() >= this.data.objects.length)
         {
            return;
         }
         this.offset += this.§_-A1Z§;
      }
      
      private function §_-SO§(param1:MouseEvent) : void
      {
         if(this.offset == 0)
         {
            return;
         }
         this.offset -= this.§_-A1Z§;
      }
      
      private function get §_-b1f§() : Boolean
      {
         return this.hero.shaman || §_-t2c§.active is §_-H1k§;
      }
      
      private function get §_-e1K§() : Boolean
      {
         if(Boolean(§_-t2c§.active is §_-H1k§) && Boolean(this.hero) && this.hero.game is §_-62b§)
         {
            return (this.hero.game as §_-62b§).§_-H2E§ == §_-at§.§_-83q§;
         }
         return §_-u24§.mode == §_-at§.§_-83q§;
      }
      
      private function get §_-93R§() : Boolean
      {
         return Boolean(this.hero && !this.§_-b1f§ && this.hero.player["level"] >= Game.§_-mN§ && !this.§_-sJ§ && !(§_-t2c§.active is §_-S2E§));
      }
      
      private function get §_-sJ§() : Boolean
      {
         return !(§_-t2c§.active is §_-H1k§) && §_-at§.§_-F2u§.nonItems;
      }
      
      private function get §_-d16§() : int
      {
         if(this.hero != null && (this.§_-b1f§ || this.hero is §_-V1t§))
         {
            return §_-5K§;
         }
         return §_-c1g§;
      }
      
      private function §_-L0§() : void
      {
         if(!this.§_-j16§.visible)
         {
            return;
         }
         var _loc1_:int = §_-c1g§ + §_-K21§.§_-q1b§ - this.§_-j16§.§_-11x§;
         if(this.§_-A1Z§ == _loc1_)
         {
            return;
         }
         this.§_-A1Z§ = _loc1_;
         this.offset = int(this.offset / this.§_-A1Z§) * this.§_-A1Z§;
         this.§_-j2y§();
         this.update();
      }
      
      private function §_-U2V§(param1:SquirrelEvent = null) : void
      {
         if(!this.§_-b1f§ || !this.§_-e1K§)
         {
            return;
         }
         this.§_-11Y§.objects = this.§_-11Y§.objects.filter(this.§_-H1t§);
         this.§_-11Y§.objects.sort(this.§_-J24§);
         this.update();
         this.§_-5z§();
      }
   }
}

