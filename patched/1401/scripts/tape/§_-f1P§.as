package tape
{
   import §_-637§.BodyDestructor;
   import §_-637§.Hammer;
   import §_-637§.§_-p1L§;
   import §_-83V§.Balk;
   import §_-83V§.BalloonBody;
   import §_-83V§.Box;
   import §_-83V§.PoiseRight;
   import §_-83V§.PortalBlue;
   import §_-83V§.PortalRed;
   import §_-83V§.Trampoline;
   import §_-83V§.WeightBody;
   import §_-83V§.§_-2p§;
   import §_-83V§.§_-Cn§;
   import §_-83V§.§_-F0§;
   import §_-83V§.§_-GN§;
   import §_-83V§.§_-GX§;
   import §_-83V§.§_-K1§;
   import §_-83V§.§_-K1U§;
   import §_-83V§.§_-K1t§;
   import §_-83V§.§_-L1p§;
   import §_-83V§.§_-L8§;
   import §_-83V§.§_-M2l§;
   import §_-83V§.§_-N1n§;
   import §_-83V§.§_-S1l§;
   import §_-83V§.§_-St§;
   import §_-83V§.§_-WQ§;
   import §_-83V§.§_-co§;
   import §_-83V§.§_-d2e§;
   import §_-83V§.§_-e2§;
   import §_-83V§.§_-ej§;
   import §_-83V§.§_-f18§;
   import §_-83V§.§_-j2W§;
   import §_-83V§.§_-r14§;
   import §_-83V§.§_-r2G§;
   import §_-83V§.§_-s6§;
   import §_-83V§.§_-sn§;
   import §_-83V§.§_-t26§;
   import §_-83V§.§_-tT§;
   import §_-83V§.§_-z20§;
   import §_-83V§.§_-z2r§;
   import §_-8I§.CastItemEvent;
   import §_-8I§.SquirrelEvent;
   import §_-B1O§.Stone;
   import §_-EH§.§_-Z16§;
   import §_-Rj§.§_-A32§;
   import §_-Rn§.§_-A2Z§;
   import §_-S1D§.§_-O1M§;
   import §_-T1r§.§_-i1L§;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-92z§;
   import §_-T2y§.§_-F29§;
   import §_-T2y§.§_-P1Y§;
   import §_-d11§.§_-4P§;
   import §_-d11§.§_-Cj§;
   import §_-d11§.§_-UT§;
   import §_-d11§.§_-p1i§;
   import §_-d11§.§_-sS§;
   import §_-jC§.§_-y2P§;
   import §_-u2r§.§_-620§;
   import §_-u2r§.§_-92D§;
   import §_-u2r§.§_-T2M§;
   import §_-u2r§.§_-rE§;
   import §_-u2r§.§_-x1A§;
   import §_-u2r§.§_-y12§;
   import buttons.§_-wc§;
   import events.CastItemsEvent;
   import events.§_-55§;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.ui.Keyboard;
   import game.mainGame.§_-bM§;
   import utils.§_-R1F§;
   
   public class §_-f1P§ extends §_-Mt§
   {
      
      private static const §_-z2T§:int = 7;
      
      private static const §_-b12§:int = 3;
      
      protected static var §_-W1n§:Array = null;
      
      protected var §_-PE§:Object = {};
      
      private var §_-sB§:Hero = null;
      
      private var §_-B3x§:Boolean = false;
      
      private var items:§_-xc§ = new §_-xc§();
      
      private var §_-G2w§:§_-xc§ = new §_-xc§();
      
      private var §_-Lk§:§_-Y5§ = new §_-Y5§();
      
      private var selected:§_-63z§ = null;
      
      public function §_-f1P§(param1:int = 4, param2:int = 1, param3:int = 0, param4:int = 0, param5:Boolean = true)
      {
         super(param1,param2,param3,param4,param5);
         setData(this.§_-G2w§);
         this.§_-bX§();
         this.update();
         if(§_-f1P§.§_-W1n§ == null)
         {
            §_-f1P§.§_-W1n§ = [§_-620§,§_-y12§,§_-x1A§,§_-A2Z§,§_-T2M§,§_-rE§,§_-r2G§,§_-92D§,§_-co§,BodyDestructor,Hammer,§_-p1L§,§_-r14§,PoiseRight,§_-K1U§,§_-2p§,§_-L8§,§_-K1§,§_-St§,BalloonBody,§_-z2r§,Trampoline,Balk,§_-GN§,§_-M2l§,§_-F0§,§_-e2§,§_-S1l§,PortalRed,PortalBlue,§_-j2W§,§_-K1t§,§_-N1n§,§_-tT§,§_-ej§,§_-f18§,§_-WQ§,§_-L1p§,§_-Cn§,§_-GX§,Box,§_-d2e§,§_-s6§,§_-t26§,§_-sn§,§_-z20§,WeightBody,Stone,§_-4P§,§_-Cj§,§_-p1i§,§_-sS§,§_-UT§];
         }
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-21G§);
      }
      
      public function get hero() : Hero
      {
         return this.§_-sB§;
      }
      
      public function set hero(param1:Hero) : void
      {
         if(this.§_-sB§ != null)
         {
            this.hero.§_-l2U§.removeEventListener(CastItemsEvent.UPDATE,this.§_-c1Z§);
            this.hero.§_-l2U§.removeEventListener(CastItemEvent.ITEM_ADD,this.addItem);
            this.hero.removeEventListener(SquirrelEvent.§_-z1B§,this.§_-o1M§);
            this.hero.removeEventListener(SquirrelEvent.§_-f2m§,this.§_-U2O§);
            this.hero.removeEventListener(SquirrelEvent.§_-S2i§,this.§_-Fo§);
            this.hero.removeEventListener(SquirrelEvent.§_-i11§,this.§_-m2Z§);
         }
         this.§_-sB§ = param1;
         if(this.hero == null)
         {
            this.§_-c1Z§();
            return;
         }
         this.hero.§_-l2U§.addEventListener(CastItemsEvent.UPDATE,this.§_-c1Z§);
         this.hero.§_-l2U§.addEventListener(CastItemEvent.ITEM_ADD,this.addItem);
         this.hero.addEventListener(SquirrelEvent.§_-z1B§,this.§_-o1M§,false,1);
         this.hero.addEventListener(SquirrelEvent.§_-f2m§,this.§_-U2O§);
         this.hero.addEventListener(SquirrelEvent.§_-S2i§,this.§_-Fo§);
         this.hero.addEventListener(SquirrelEvent.§_-i11§,this.§_-m2Z§);
         this.§_-c1Z§();
      }
      
      public function reset() : void
      {
         this.data.clear();
      }
      
      public function §_-91M§(param1:Class) : void
      {
         this.§_-D2P§();
         var _loc2_:int = 0;
         while(_loc2_ < this.items.objects.length)
         {
            if((this.items.objects[_loc2_] as §_-63z§).§_-L1z§.§_-D28§ == param1)
            {
               if(!(this.§_-nv§ && !((this.items.objects[_loc2_] as §_-63z§).§_-L1z§.type == §_-bM§.§_-Qg§ || (this.items.objects[_loc2_] as §_-63z§).§_-L1z§.type == §_-bM§.§_-t2G§)))
               {
                  if(!(!this.§_-nv§ && !((this.items.objects[_loc2_] as §_-63z§).§_-L1z§.type == §_-bM§.§_-S2D§ || (this.items.objects[_loc2_] as §_-63z§).§_-L1z§.type == §_-bM§.§_-t2G§)))
                  {
                     this.selected = this.items.objects[_loc2_] as §_-63z§;
                     this.selected.§_-82I§();
                  }
               }
            }
            _loc2_++;
         }
      }
      
      public function §_-D2P§() : void
      {
         if(this.selected != null)
         {
            this.selected.§_-Pu§();
         }
         this.selected = null;
      }
      
      public function §_-02n§() : void
      {
         this.§_-536§();
      }
      
      override protected function update() : void
      {
         var _loc2_:§_-63z§ = null;
         var _loc1_:Boolean = this.§_-73T§;
         if(!_loc1_ && this.§_-E2J§ != this.§_-93i§)
         {
            this.§_-E2J§ = this.§_-93i§;
            this.§_-bX§();
         }
         super.update();
         for each(_loc2_ in this.items.objects)
         {
            if(_loc2_.§_-L1z§.type == §_-bM§.§_-t2G§)
            {
               _loc2_.icon.alpha = _loc2_.§_-L1z§.count > 0 ? 1 : 0.1;
            }
         }
         this.§_-Lk§.visible = _loc1_;
         dispatchEvent(new CastItemEvent(CastItemEvent.TAPE_UPDATE,null));
         this.§_-536§();
      }
      
      override protected function §_-bX§() : void
      {
         var _loc1_:ButtonRewindLeft = null;
         var _loc2_:ButtonRewindLeftInactive = null;
         var _loc3_:ButtonRewindRight = null;
         var _loc4_:ButtonRewindRightInactive = null;
         if(this.§_-Z2B§ == null)
         {
            _loc1_ = new ButtonRewindLeft();
            _loc1_.upState.cacheAsBitmap = true;
            _loc2_ = new ButtonRewindLeftInactive();
            _loc2_.upState.cacheAsBitmap = true;
            this.§_-Z2B§ = new §_-wc§(_loc1_,_loc2_);
         }
         if(this.buttonNext == null)
         {
            _loc3_ = new ButtonRewindRight();
            _loc3_.upState.cacheAsBitmap = true;
            _loc4_ = new ButtonRewindRightInactive();
            _loc4_.upState.cacheAsBitmap = true;
            this.buttonNext = new §_-wc§(_loc3_,_loc4_);
         }
         this.§_-Z2B§.x = 2;
         this.§_-Z2B§.y = int(((this.offsetY + this.§_-c28§) * this.§_-x16§ - this.buttonNext.height) * 0.5);
         this.buttonNext.x = (this.offsetX + this.§_-i2s§) * this.§_-E2J§ - this.offsetX - 12;
         this.buttonNext.y = int(((this.offsetY + this.§_-c28§) * this.§_-x16§ - this.buttonNext.height) * 0.5);
         addChild(this.§_-Z2B§);
         addChild(this.buttonNext);
         this.§_-Z2B§.addEventListener(MouseEvent.CLICK,this.§_-N2G§);
         this.buttonNext.addEventListener(MouseEvent.CLICK,this.§_-6C§);
         this.§_-Lk§.x = (this.items.objects.length < §_-X2w§() ? Math.min(§_-X2w§(),this.items.objects.length - this.offset) : §_-X2w§()) * (this.offsetX + this.§_-i2s§) + 63;
         addChild(this.§_-Lk§);
      }
      
      protected function §_-92Y§(param1:MouseEvent = null) : void
      {
         param1.stopImmediatePropagation();
         var _loc2_:§_-63z§ = param1.currentTarget as §_-63z§;
         dispatchEvent(new §_-55§(_loc2_.§_-L1z§.§_-D28§));
      }
      
      private function §_-c1Z§(param1:CastItemsEvent = null) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.items.objects.length)
         {
            this.items.objects[_loc2_].removeEventListener(CastItemEvent.§_-q1E§,this.§_-23Y§);
            this.items.objects[_loc2_].removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-92Y§);
            (this.items.objects[_loc2_] as §_-63z§).dispose();
            _loc2_++;
         }
         this.§_-B3x§ = false;
         this.items = new §_-xc§();
         if(this.hero == null)
         {
            this.§_-Fo§();
            return;
         }
         this.addItems(this.hero.§_-l2U§.items);
         if(Boolean(!this.§_-B3x§ && this.§_-nv§) && Boolean(this.hero.game) && Boolean(this.hero.game.map))
         {
            this.§_-Fc§();
         }
      }
      
      private function addItem(param1:CastItemEvent) : void
      {
         var _loc3_:§_-63z§ = null;
         if(§_-f1P§.§_-W1n§.indexOf(param1.§_-L1z§.§_-D28§) == -1)
         {
            return;
         }
         var _loc2_:Boolean = this.§_-nv§ ? param1.§_-L1z§.type != §_-bM§.§_-S2D§ : param1.§_-L1z§.type != §_-bM§.§_-Qg§;
         if(param1.§_-L1z§.type == §_-bM§.§_-Qg§)
         {
            _loc3_ = new §_-63z§(param1.§_-L1z§);
         }
         else
         {
            _loc3_ = new §_-M1C§(param1.§_-L1z§);
            _loc3_.§_-L1z§.addEventListener(CastItemEvent.§_-q1E§,this.§_-23Y§);
         }
         _loc3_.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-92Y§);
         this.items.addObject(_loc3_);
         if(!_loc2_)
         {
            return;
         }
         if(!this.§_-nv§ && this.§_-31C§ && param1.§_-L1z§.type == §_-bM§.§_-S2D§)
         {
            return;
         }
         this.§_-G2w§.addObject(_loc3_);
         this.§_-G2w§.objects.sort(this.§_-C1e§);
         this.update();
         this.§_-536§();
         this.§_-Lk§.§_-yg§ = this.§_-G2w§.objects;
         this.§_-Hv§();
      }
      
      private function addItems(param1:Vector.<§_-bM§>) : void
      {
         var _loc3_:§_-63z§ = null;
         if(this.items == null)
         {
            this.items = new §_-xc§();
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            if(§_-f1P§.§_-W1n§.indexOf(param1[_loc2_].§_-D28§) != -1)
            {
               if(param1[_loc2_].type == §_-bM§.§_-Qg§)
               {
                  _loc3_ = new §_-63z§(param1[_loc2_]);
               }
               else
               {
                  _loc3_ = new §_-M1C§(param1[_loc2_]);
                  _loc3_.§_-L1z§.addEventListener(CastItemEvent.§_-q1E§,this.§_-23Y§);
               }
               _loc3_.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-92Y§);
               this.items.addObject(_loc3_);
            }
            _loc2_++;
         }
         this.§_-Fo§();
      }
      
      private function §_-Fo§(param1:SquirrelEvent = null) : void
      {
         if(this.hero != null && (this.§_-nv§ || this.hero is §_-i1L§))
         {
            this.§_-E2J§ = §_-z2T§;
         }
         else
         {
            this.§_-E2J§ = §_-b12§;
         }
         this.§_-bX§();
         if(this.hero == null)
         {
            this.§_-G2w§.clear();
            return;
         }
         if(!this.§_-B3x§ && this.§_-nv§)
         {
            this.§_-Fc§();
            return;
         }
         this.§_-G2w§.objects = this.items.objects.filter(this.§_-U1J§);
         this.§_-G2w§.objects.sort(this.§_-C1e§);
         this.§_-m2Z§();
         this.update();
         this.§_-Lk§.§_-yg§ = this.§_-G2w§.objects;
         this.§_-Hv§();
         this.§_-536§();
      }
      
      private function §_-Fc§() : void
      {
         this.§_-B3x§ = true;
         if(!this.hero || !this.hero.game)
         {
            return;
         }
         if(!this.hero.game.map || !this.hero.game.map.§_-u1T§)
         {
            return;
         }
         var _loc1_:Vector.<§_-bM§> = §_-R1F§.§_-V2A§(this.hero.game.map.§_-u1T§);
         this.addItems(_loc1_);
      }
      
      private function §_-U1J§(param1:§_-63z§, param2:int, param3:Vector.<§_-K2k§>) : Boolean
      {
         if(Boolean(param2) || Boolean(param3))
         {
         }
         if(this.§_-nv§ && (param1.§_-L1z§.type == §_-bM§.§_-Qg§ || param1.§_-L1z§.type == §_-bM§.§_-t2G§))
         {
            return true;
         }
         if(!this.§_-nv§ && this.§_-31C§ && param1.§_-L1z§.type == §_-bM§.§_-S2D§)
         {
            return false;
         }
         return !this.§_-nv§ && (param1.§_-L1z§.type == §_-bM§.§_-S2D§ || param1.§_-L1z§.type == §_-bM§.§_-t2G§);
      }
      
      private function §_-t1§(param1:§_-63z§, param2:int, param3:Vector.<§_-K2k§>) : Boolean
      {
         if(Boolean(param2) || Boolean(param3))
         {
         }
         if(param1.§_-L1z§.type == §_-bM§.§_-S2D§)
         {
            return true;
         }
         param1.dispose();
         param1.removeEventListener(CastItemEvent.§_-q1E§,this.§_-23Y§);
         return false;
      }
      
      private function §_-32E§(param1:§_-63z§, param2:int, param3:Vector.<§_-K2k§>) : Boolean
      {
         if(Boolean(param2) || Boolean(param3))
         {
         }
         if(param1.§_-L1z§.type == §_-bM§.§_-S2D§ || param1.§_-L1z§.type == §_-bM§.§_-Qg§)
         {
            return true;
         }
         param1.dispose();
         param1.removeEventListener(CastItemEvent.§_-q1E§,this.§_-23Y§);
         return false;
      }
      
      private function §_-Ij§(param1:§_-63z§, param2:int, param3:Vector.<§_-K2k§>) : Boolean
      {
         var _loc4_:§_-bM§ = null;
         if(Boolean(param2) || Boolean(param3))
         {
         }
         if(param1.§_-L1z§.type == §_-bM§.§_-Qg§)
         {
            return true;
         }
         if(param1.§_-L1z§.type == §_-bM§.§_-t2G§)
         {
            return true;
         }
         if(Boolean(this.hero) && Boolean(this.hero.§_-l2U§))
         {
            _loc4_ = this.hero.§_-l2U§.§_-43X§(param1.§_-L1z§.§_-D28§,param1.§_-L1z§.type);
            if(!_loc4_)
            {
               param1.dispose();
               param1.removeEventListener(CastItemEvent.§_-q1E§,this.§_-23Y§);
               return false;
            }
         }
         if(param1.§_-L1z§.count > 0)
         {
            return true;
         }
         param1.dispose();
         param1.removeEventListener(CastItemEvent.§_-q1E§,this.§_-23Y§);
         return false;
      }
      
      private function §_-F1o§(param1:§_-63z§, param2:int, param3:Vector.<§_-K2k§>) : Boolean
      {
         if(Boolean(param2) || Boolean(param3))
         {
         }
         if(Boolean(this.hero) && Boolean(this.hero.team == Hero.§_-114§) && (param1.§_-L1z§.§_-D28§ == §_-ej§ || param1.§_-L1z§.§_-D28§ == §_-f18§ || param1.§_-L1z§.§_-D28§ == §_-Cn§ || param1.§_-L1z§.§_-D28§ == §_-GX§))
         {
            return false;
         }
         if(Boolean(this.hero) && Boolean(this.hero.team == Hero.§_-17§) && (param1.§_-L1z§.§_-D28§ == §_-N1n§ || param1.§_-L1z§.§_-D28§ == §_-tT§ || param1.§_-L1z§.§_-D28§ == §_-WQ§ || param1.§_-L1z§.§_-D28§ == §_-L1p§))
         {
            return false;
         }
         return true;
      }
      
      private function §_-C1e§(param1:§_-63z§, param2:§_-63z§) : int
      {
         if(§_-f1P§.§_-W1n§.indexOf(param1.§_-L1z§.§_-D28§) < §_-f1P§.§_-W1n§.indexOf(param2.§_-L1z§.§_-D28§))
         {
            return -1;
         }
         if(§_-f1P§.§_-W1n§.indexOf(param1.§_-L1z§.§_-D28§) > §_-f1P§.§_-W1n§.indexOf(param2.§_-L1z§.§_-D28§))
         {
            return 1;
         }
         if(param1.§_-L1z§.type > param2.§_-L1z§.type)
         {
            return 1;
         }
         return -1;
      }
      
      private function §_-U2O§(param1:SquirrelEvent) : void
      {
         this.items.objects = this.items.objects.filter(this.§_-t1§);
         this.§_-B3x§ = false;
         this.§_-Fo§();
      }
      
      private function §_-o1M§(param1:SquirrelEvent) : void
      {
         this.items.objects = this.items.objects.filter(this.§_-32E§);
         this.§_-Fo§();
      }
      
      private function §_-23Y§(param1:CastItemEvent) : void
      {
         this.items.objects = this.items.objects.filter(this.§_-Ij§);
         this.§_-G2w§.objects = this.§_-G2w§.objects.filter(this.§_-Ij§);
         this.§_-G2w§.objects.sort(this.§_-C1e§);
         this.§_-bX§();
         this.update();
         this.§_-536§();
         this.§_-Lk§.§_-yg§ = this.§_-G2w§.objects;
         this.§_-Hv§();
      }
      
      private function §_-536§() : void
      {
         this.§_-PE§ = {};
         this.§_-r2v§();
         if(!this.data || this.data.objects.length == 0 || §_-O1M§.§_-u2c§)
         {
            return;
         }
         var _loc1_:int = 0;
         while(_loc1_ < this.data.objects.length && _loc1_ < 10)
         {
            this.§_-PE§[_loc1_] = (this.data.objects[_loc1_] as §_-63z§).§_-L1z§.§_-D28§;
            if(_loc1_ == 9)
            {
               (this.data.objects[_loc1_] as §_-63z§).§_-P1l§(0);
            }
            else
            {
               (this.data.objects[_loc1_] as §_-63z§).§_-P1l§(_loc1_ + 1);
            }
            _loc1_++;
         }
      }
      
      private function §_-r2v§() : void
      {
         if(!this.data)
         {
            return;
         }
         var _loc1_:int = 0;
         while(_loc1_ < this.data.objects.length)
         {
            (this.data.objects[_loc1_] as §_-63z§).§_-73h§();
            _loc1_++;
         }
      }
      
      private function §_-21G§(param1:KeyboardEvent) : void
      {
         if(param1.shiftKey || param1.ctrlKey)
         {
            return;
         }
         if(Game.chat.visible || §_-y2P§.visible || §_-Z16§.visible || §_-O1M§.§_-u2c§)
         {
            return;
         }
         if(param1.keyCode == Keyboard.TAB && §_-O1M§.perksAvailable && !(§_-71o§.active is §_-P1Y§))
         {
            this.§_-536§();
            return;
         }
         var _loc2_:int = param1.keyCode - 49;
         if(_loc2_ in this.§_-PE§ && this.visible)
         {
            dispatchEvent(new §_-55§(this.§_-PE§[_loc2_]));
            param1.stopImmediatePropagation();
            return;
         }
         if(_loc2_ == -1 && "9" in this.§_-PE§)
         {
            dispatchEvent(new §_-55§(this.§_-PE§["9"]));
            param1.stopImmediatePropagation();
         }
      }
      
      private function §_-6C§(param1:MouseEvent) : void
      {
         if(this.offset + §_-X2w§() >= this.data.objects.length)
         {
            return;
         }
         this.offset += this.§_-E2J§;
      }
      
      private function §_-N2G§(param1:MouseEvent) : void
      {
         if(this.offset == 0)
         {
            return;
         }
         this.offset -= this.§_-E2J§;
      }
      
      private function get §_-nv§() : Boolean
      {
         return this.hero.shaman || §_-71o§.active is §_-P1Y§;
      }
      
      private function get §_-3a§() : Boolean
      {
         if(Boolean(§_-71o§.active is §_-P1Y§) && Boolean(this.hero) && this.hero.game is §_-A32§)
         {
            return (this.hero.game as §_-A32§).§_-Z1G§ == §_-q1p§.§_-l1M§;
         }
         return §_-92z§.mode == §_-q1p§.§_-l1M§;
      }
      
      private function get §_-73T§() : Boolean
      {
         return Boolean(this.hero && !this.§_-nv§ && this.hero.player["level"] >= Game.§_-t1X§ && !this.§_-31C§ && !(§_-71o§.active is §_-F29§));
      }
      
      private function get §_-31C§() : Boolean
      {
         return !(§_-71o§.active is §_-P1Y§) && §_-q1p§.§_-Vz§.nonItems;
      }
      
      private function get §_-93i§() : int
      {
         if(this.hero != null && (this.§_-nv§ || this.hero is §_-i1L§))
         {
            return §_-z2T§;
         }
         return §_-b12§;
      }
      
      private function §_-Hv§() : void
      {
         if(!this.§_-Lk§.visible)
         {
            return;
         }
         var _loc1_:int = §_-b12§ + §_-Y5§.§_-a2Y§ - this.§_-Lk§.§_-P1A§;
         if(this.§_-E2J§ == _loc1_)
         {
            return;
         }
         this.§_-E2J§ = _loc1_;
         this.offset = int(this.offset / this.§_-E2J§) * this.§_-E2J§;
         this.§_-bX§();
         this.update();
      }
      
      private function §_-m2Z§(param1:SquirrelEvent = null) : void
      {
         if(!this.§_-nv§ || !this.§_-3a§)
         {
            return;
         }
         this.§_-G2w§.objects = this.§_-G2w§.objects.filter(this.§_-F1o§);
         this.§_-G2w§.objects.sort(this.§_-C1e§);
         this.update();
         this.§_-536§();
      }
   }
}

